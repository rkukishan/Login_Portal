import 'package:mvvm_db/data/database/database_variable.dart';
import 'package:mvvm_db/data/database/db_exception.dart';
import 'package:mvvm_db/data/database/db_helper.dart';
import 'package:mvvm_db/model/login_model.dart';
import 'package:mvvm_db/model/student_model.dart';
import 'package:mvvm_db/utils/toast_msg.dart';

class StudentLogin {
  Future<StudentModel> loginStudent(LoginModel loginModel) async {
    var dbClient = await DBHelper.appDatabase;
    var res = await dbClient!.rawQuery(
        "SELECT * FROM ${AppVariable.tblName} WHERE studentEmail = '${loginModel.email}' and studentPassword = '${loginModel.password}'");

    if (res.isNotEmpty) {
      return StudentModel.fromMap(res.first);
    }else{
      ToastMsg().toastMsg("Username Invalid");
    }
    
    return throw(UserNotFoundError("User not found"));
  }
}
