import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:web_tut/models/student_number.dart';
import 'package:web_tut/providers/studnumber_provider.dart';

class StudnumbersScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final studnumCtrl = TextEditingController();
  final studnameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Student Numbers",
          style: TextStyle(color: Colors.blue),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          StreamBuilder<List<StudentNumber>>(
            stream: context.watch<StudnumberProvider>().idnumbers,
            builder: (context, snapshot) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  // itemCount: 3,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(snapshot.data![index].idNumber),
                        subtitle: Text(snapshot.data![index].name),
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.blue,
                                    contentPadding: EdgeInsets.zero,
                                    titlePadding: EdgeInsets.only(top: 12),
                                    elevation: 15,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(32.0),
                                      ),
                                      side: BorderSide(
                                          color: Colors.blue, width: 4),
                                    ),
                                    title: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 18),
                                          child: Text(
                                            "Remove Student Number",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )),
                                    content: Expanded(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(32),
                                              bottomRight: Radius.circular(32)),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 36,
                                            horizontal: 20,
                                          ),
                                          child: Column(
                                            children: [
                                              //body
                                              Expanded(
                                                child: Container(
                                                  child: Text(
                                                      "Do you really want to remove this Student Number?"),
                                                ),
                                              ),
                                              SizedBox(),
                                              //bottom buttons\
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  GFButton(
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                              StudnumberProvider>()
                                                          .removeIdNumber(
                                                              snapshot
                                                                  .data![index]
                                                                  .idNumber);
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .pop();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  800),
                                                          content: Text(
                                                              'Successfully removed!'),
                                                        ),
                                                      );
                                                      studnumCtrl.clear();
                                                    },
                                                    color: Colors.red,
                                                    child: Text("Remove"),
                                                  ),
                                                  GFButton(
                                                    onPressed: () {
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .pop();
                                                      studnumCtrl.clear();
                                                    },
                                                    color: Colors.blue,
                                                    child: Text("Cancel"),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                        // title: Text("Hello"),
                      ),
                    );
                  });
            },
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 1.3,
              right: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   width: MediaQuery.of(context).size.width / 3,
                // ),
                GFButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.blue,
                          contentPadding: EdgeInsets.zero,
                          titlePadding: EdgeInsets.only(top: 12),
                          elevation: 15,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32.0),
                            ),
                            side: BorderSide(color: Colors.blue, width: 4),
                          ),
                          title: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 18),
                                child: Text(
                                  "Add Student Number",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                          content: Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width / 1.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(32),
                                    bottomRight: Radius.circular(32)),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 36,
                                  horizontal: 20,
                                ),
                                child: Column(
                                  children: [
                                    //body
                                    Expanded(
                                      child: Form(
                                        key: _formKey,
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              controller: studnumCtrl,
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 20.0,
                                                        vertical: 10.0),
                                                labelText: 'New Student Number',
                                                labelStyle: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              onChanged: (String value) =>
                                                  context
                                                      .read<
                                                          StudnumberProvider>()
                                                      .changeIdNumber = value,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please provide a valid input';
                                                }
                                                return null;
                                              },
                                            ),
                                            SizedBox(
                                              height: 18,
                                            ),
                                            TextFormField(
                                              controller: studnameCtrl,
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 20.0,
                                                        vertical: 10.0),
                                                labelText: 'New Student Name',
                                                labelStyle: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              onChanged: (String value) =>
                                                  context
                                                      .read<
                                                          StudnumberProvider>()
                                                      .changeName = value,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please provide a valid input';
                                                }
                                                return null;
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    //bottom buttons\
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GFButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              context.read<StudnumberProvider>()
                                                ..saveIdNumber();
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  content: Text(
                                                      'Successfully added!'),
                                                ),
                                              );
                                            }
                                            studnumCtrl.clear();
                                            studnameCtrl.clear();
                                          },
                                          child: Text("Add"),
                                        ),
                                        GFButton(
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                            studnumCtrl.clear();
                                            studnameCtrl.clear();
                                          },
                                          color: Colors.red,
                                          child: Text("Cancel"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  shape: GFButtonShape.pills,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Add Student Number"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
