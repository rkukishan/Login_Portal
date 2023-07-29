import 'package:flutter/foundation.dart';
import 'package:mvvm_db/data/database/database_variable.dart';
import 'package:mvvm_db/data/database/student_login.dart';
import 'package:mvvm_db/model/login_model.dart';
import 'package:mvvm_db/model/student_model.dart';
import 'package:mvvm_db/utils/toast_msg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel with ChangeNotifier {
  StudentLogin studentLogin = StudentLogin();

  Future<bool> loginStudent(LoginModel loginModel) async {
    var res = await studentLogin.loginStudent(loginModel);
    if (loginModel.email == res.studentEmail &&
        loginModel.password == res.studentPassword) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString(AppVariable.spKey, loginModel.email.toString());
      notifyListeners();
      return true;
    } else {
      ToastMsg().toastMsg("Login Failed");
      return false;
    }
  }

  Future<String?> getSpValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? value = preferences.getString(AppVariable.spKey);
    print("get sp ${value.toString()}");
    notifyListeners();
    return value;
  }

  Future<void> clearSP() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(AppVariable.spKey);
    notifyListeners();
  }
}
