import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:web_tut/models/college.dart';
import 'package:web_tut/models/course.dart';
import 'package:web_tut/providers/college_provider.dart';
import 'package:web_tut/providers/course_provider.dart';
import 'package:web_tut/services/firestore_service.dart';

class CourseScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final courseCtrl = TextEditingController();
  final collegeCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Courses",
          style: TextStyle(color: Colors.blue),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          StreamBuilder<List<Course>>(
              stream: context.watch<CourseProvider>().courses,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                              snapshot.data![index].courseName.toUpperCase()),
                          subtitle: Row(
                            children: [
                              Text('College: '),
                              Text(snapshot.data![index].college),
                            ],
                          ),
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
                                              "Remove Course",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )),
                                      content: Expanded(
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.5,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(32),
                                                bottomRight:
                                                    Radius.circular(32)),
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
                                                        "Do you really want to remove this Course?"),
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
                                                                CourseProvider>()
                                                            .removeCourse(
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .courseId);
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
                                                                    500),
                                                            content: Text(
                                                                'Successfully removed!'),
                                                          ),
                                                        );
                                                        collegeCtrl.clear();
                                                        courseCtrl.clear();
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
                                                        collegeCtrl.clear();
                                                        courseCtrl.clear();
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
                        ),
                      );
                    });
              }),
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
                                  "Add Course",
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
                                              controller: courseCtrl,
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
                                                labelText: 'College Name',
                                                labelStyle: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              onChanged: (String value) =>
                                                  context
                                                      .read<CourseProvider>()
                                                      .changeCollege = value,
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
                                              controller: collegeCtrl,
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
                                                labelText: 'New Course Name',
                                                labelStyle: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              onChanged: (String value) =>
                                                  context
                                                      .read<CourseProvider>()
                                                      .changeCourseName = value,
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
                                              context.read<CourseProvider>()
                                                ..saveCourse();
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
                                            collegeCtrl.clear();
                                            courseCtrl.clear();
                                          },
                                          child: Text("Add"),
                                        ),
                                        GFButton(
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                            collegeCtrl.clear();
                                            courseCtrl.clear();
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
                    child: Text("Add Course"),
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
