class StudentNumber {
  late final String idNumber;
  late final String name;

  StudentNumber({
    required this.idNumber,
    required this.name,
  });

  factory StudentNumber.fromJson(Map<String, dynamic> json) {
    return StudentNumber(
      idNumber: json['idNumber'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idNumber': idNumber,
      'name': name,
    };
  }
}
