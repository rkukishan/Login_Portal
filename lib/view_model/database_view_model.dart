
import 'package:flutter/foundation.dart';
import 'package:mvvm_db/data/database/db_helper.dart';
import 'package:mvvm_db/data/database/insert_student_data.dart';
import 'package:mvvm_db/model/student_model.dart';
import 'package:mvvm_db/utils/toast_msg.dart';


class DatabaseViewModel with ChangeNotifier{
  InsertStudent insertStudent = InsertStudent();

  setInsertData(StudentModel studentModel) async {
   await insertStudent.insertValue(studentModel).then((value) {
     ToastMsg().toastMsg("Store Data");
     notifyListeners();
   }).onError((error, stackTrace) {
     ToastMsg().toastMsg("Student Data Can't Save");
   });
  }

}