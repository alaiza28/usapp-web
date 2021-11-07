import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_tut/models/college.dart';
import 'package:web_tut/models/course.dart';
import 'package:web_tut/models/student_number.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  //Student Numbers
  //get
  Stream<List<StudentNumber>> getStudentNumbers() {
    return _db.collection('student_numbers').snapshots().map((snapshot) =>
        snapshot.docs
            .map((doc) => StudentNumber.fromJson(doc.data()))
            .toList());
  }

  //upsert
  Future<void> setStudentNumber(StudentNumber studentNumber) {
    var options = SetOptions(merge: true);

    return _db
        .collection('student_numbers')
        .doc(studentNumber.idNumber)
        .set(studentNumber.toMap(), options);
  }

  //delete
  Future<void> removeStudentNumber(String studentNumber) {
    return _db.collection('student_numbers').doc(studentNumber).delete();
  }

  //Colleges
  //get
  Stream<List<College>> getColleges() {
    return _db.collection('colleges').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => College.fromJson(doc.data())).toList());
  }

  //upsert
  Future<void> setCollege(College college) {
    var options = SetOptions(merge: true);

    return _db
        .collection('colleges')
        .doc(college.collegeID)
        .set(college.toMap(), options);
  }

  //delete
  Future<void> removeCollege(String collegeID) {
    return _db.collection('colleges').doc(collegeID).delete();
  }

  //Courses
  //get
  Stream<List<Course>> getCourses() {
    return _db.collection('courses').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Course.fromJson(doc.data())).toList());
  }

  //upsert
  Future<void> setCourse(Course course) {
    var options = SetOptions(merge: true);

    return _db
        .collection('courses')
        .doc(course.courseId)
        .set(course.toMap(), options);
  }

  //delete
  Future<void> removeCourse(String courseID) {
    return _db.collection('courses').doc(courseID).delete();
  }
}
