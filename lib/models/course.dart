import 'dart:convert';

class Course {
  late String college;
  late String courseId;
  late String courseName;

  Course({
    required this.college,
    required this.courseId,
    required this.courseName,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      college: json['college'],
      courseId: json['courseID'],
      courseName: json['course_name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'college': college,
      'couresID': courseId,
      'course_name': courseName
    };
  }
}
