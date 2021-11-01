import 'package:flutter/material.dart';
import 'package:web_tut/models/student_number.dart';
import 'package:web_tut/services/firestore_service.dart';

class StudnumberProvider with ChangeNotifier {
  final firestoreService = FirestoreService();

  late String _idNumber;
  late String _name;

  //getters
  String get idNumber => _idNumber;
  String get name => _name;
  Stream<List<StudentNumber>> get idnumbers =>
      firestoreService.getStudentNumbers();

  //setters
  set changeIdNumber(String idnumber) {
    _idNumber = idnumber;
    notifyListeners();
  }

  set changeName(String name) {
    _name = name;
    notifyListeners();
  }

  //functions
  loadAll(StudentNumber studentNumber) {
    if (studentNumber != null) {
      _idNumber = studentNumber.idNumber;
    } else {
      _idNumber = "";
    }
  }

  // saveStudName() {
  //   var updat
  // }

  saveIdNumber() {
    var updatedStudentNumber = StudentNumber(idNumber: _idNumber, name: _name);
    firestoreService.setStudentNumber(updatedStudentNumber);
  }

  removeIdNumber(String idNumber) {
    firestoreService.removeStudentNumber(idNumber);
  }
}
