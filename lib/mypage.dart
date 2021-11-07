import 'package:flutter/material.dart';
import 'package:web_tut/screens/colleges_screen.dart';
import 'package:web_tut/screens/course_screen.dart';
import 'package:web_tut/screens/studnumbers_screen.dart';
import 'package:web_tut/screens/users_screen.dart';
import 'package:web_tut/utils/vertical_tabs.dart';

class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UsApp Administrator Panel"),
      ),
      body: VerticalTabs(
        tabsWidth: MediaQuery.of(context).size.width / 3.5,
        direction: TextDirection.ltr,
        contentScrollAxis: Axis.vertical,
        changePageDuration: Duration(milliseconds: 500),
        tabs: <Tab>[
          Tab(
            child: Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Row(
                children: [
                  Icon(
                    Icons.group,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 21,
                  ),
                  Text(
                    "Users",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Tab(
            child: Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Row(
                children: [
                  Icon(
                    Icons.assignment_ind,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 21,
                  ),
                  Text(
                    "Student Number",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Tab(
            child: Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Row(
                children: [
                  Icon(
                    Icons.account_balance,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 21,
                  ),
                  Text(
                    "Colleges",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Tab(
            child: Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Row(
                children: [
                  Icon(
                    Icons.menu_book,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 21,
                  ),
                  Text(
                    "Courses",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
        contents: <Widget>[
          // Container(
          //   color: Colors.amber,
          // ),
          UsersScreen(),
          // Container(
          //   color: Colors.amberAccent,
          // ),
          StudnumbersScreen(),
          // Container(
          //   color: Colors.amber,
          // ),
          CollegesScreen(),
          // Container(
          //   color: Colors.amberAccent,
          // ),
          CourseScreen(),
        ],
      ),
    );
  }

  Widget tabsContent(String caption, [String description = '']) {
    return Container(
      margin: EdgeInsets.all(1),
      padding: EdgeInsets.all(2),
      child: Column(
        children: <Widget>[
          Text(
            caption,
            style: TextStyle(fontSize: 25),
          ),
          Divider(
            height: 20,
            color: Colors.black45,
          ),
          Text(
            description,
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
