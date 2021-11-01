class Campus {
  late String campusName;

  Campus({required this.campusName});

  factory Campus.fromJson(Map<String, dynamic> json) {
    return Campus(
      campusName: json['campus_name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'campus_name': campusName,
    };
  }
}
