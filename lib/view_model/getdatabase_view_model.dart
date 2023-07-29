import 'package:flutter/material.dart';
import 'package:mvvm_db/data/database/get_all_student.dart';
import 'package:mvvm_db/model/student_model.dart';
import 'package:mvvm_db/utils/toast_msg.dart';

class GetAllStudentViewModel with ChangeNotifier {
  List<StudentModel> _listData = [];

  List<StudentModel> get listData => _listData;
  GetAllStudent getAllStudents = GetAllStudent();

  getAllStudent(String val) async {
    _limitData = int.parse(val);
    _listData = await getAllStudents.getAllStudent(_limitData!);
    print("my data is ${_listData}");
    return _listData;
  }

  int? _limitData;

  int get limitData => _limitData!;

  setLimitData(String? searchController) {

    if (searchController != null) {
      _limitData = int.parse(searchController);
      print("liimit data is ${_limitData}");
      notifyListeners();
    }else{
      ToastMsg().toastMsg("Field Empty");
    }
  }
}
