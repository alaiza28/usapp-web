import 'package:flutter/cupertino.dart';
import 'package:web_tut/models/course.dart';
import 'package:web_tut/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class CourseProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  late String _college;
  late String _couresId;
  late String _couresName;
  var uuid = const Uuid();

  //getters
  String get college => _college;
  String get courseId => _couresId;
  String get courseName => _couresName;
  Stream<List<Course>> get courses => firestoreService.getCourses();

  //setters
  set changeCollege(String college) {
    _college = college;
    notifyListeners();
  }

  set changeCourseName(String courseName) {
    _couresName = courseName;
    notifyListeners();
  }

  //functions
  loadAll(Course course) {
    _college = course.college;
    _couresId = course.courseId;
    _couresName = course.courseName;
  }

  saveCourse() {
    var updatedCourse = Course(
        college: _college,
        courseId: uuid.v1().toString(),
        courseName: _couresName);
    firestoreService.setCourse(updatedCourse);
  }

  removeCourse(String courseId) {
    firestoreService.removeCourse(courseId);
  }
}
