import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';
import 'package:web_tut/models/college.dart';
import 'package:web_tut/services/firestore_service.dart';

class CollegeProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  late String _campus;
  late String _collegeID;
  late String _collegeName;
  var uuid = const Uuid();

  //getters
  String get campus => _campus;
  String get collegeID => _collegeID;
  String get collegeName => _collegeName;
  Stream<List<College>> get colleges => firestoreService.getColleges();

  //setters
  set changeCampus(String campus) {
    _campus = campus;
    notifyListeners();
  }

  set changeCollegename(String collegeName) {
    _collegeName = collegeName;
    notifyListeners();
  }

  //functions
  loadAll(College college) {
    _campus = college.campus;
    _collegeName = college.collegeName;
    _collegeID = college.collegeID;
  }

  saveCollege() {
    var updatedCollege = College(
        campus: _campus,
        collegeName: _collegeName,
        collegeID: uuid.v1().toString());
    firestoreService.setCollege(updatedCollege);
  }

  removeCollege(String collegeID) {
    firestoreService.removeCollege(collegeID);
  }
}
