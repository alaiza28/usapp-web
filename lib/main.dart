import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_tut/mypage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:web_tut/providers/college_provider.dart';
import 'package:web_tut/providers/studnumber_provider.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudnumberProvider()),
        ChangeNotifierProvider(create: (_) => CollegeProvider()),
      ],
      child: MaterialApp(
        title: 'UsApp Admin',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          // Initialize FlutterFire:
          future: _initialization,
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              print("Error");
            }

            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              return MyPage();
            }

            // Otherwise, show something whilst waiting for initialization to complete
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
