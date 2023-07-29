class StudentModel {
  String? studentEmail;
  String? studentPassword;
  String? studentName;
  String? studentClass;
  String? studentBranch;
  String? studentImage;
  int? studentRollNo;
  int? studentResult;
  String? studentBirthDate;

  StudentModel(
      {required this.studentEmail,
      required this.studentPassword,
      required this.studentName,
      required this.studentClass,
      required this.studentBranch,
      required this.studentImage,
      required this.studentRollNo,
      required this.studentResult,
      required this.studentBirthDate});

  StudentModel.fromMap(Map<String, dynamic> res)
      : studentEmail = res["studentEmail"],
        studentPassword = res["studentPassword"],
        studentName = res["studentName"],
        studentClass = res["studentClass"],
        studentBranch = res["studentBranch"],
        studentImage = res["studentImage"],
        studentRollNo = res["studentRollNo"],
        studentResult = res["studentResult"],
        studentBirthDate = res["studentBirthDate"];

  Map<String, dynamic> toMap() {
    return {
      "studentEmail": studentEmail,
      "studentPassword": studentPassword,
      "studentName": studentName,
      "studentClass": studentClass,
      "studentBranch": studentBranch,
      "studentImage": studentImage,
      "studentRollNo": studentRollNo,
      "studentResult": studentResult,
      "studentBirthDate": studentBirthDate
    };
  }
}
