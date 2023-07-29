import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm_db/utils/routes_name.dart';
import 'package:mvvm_db/view_model/login_view_model.dart';

class SplashViewModel {
  LoginViewModel loginViewModel = LoginViewModel();

  Future<void> splashViewHold(BuildContext context) async {
    String? data = await loginViewModel.getSpValue();
    Timer(const Duration(seconds: 3), () {
      print("sp data = ${data.toString()}");

      if (data == "" || data == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.loginView, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.homeView, (route) => false);
      }
    });
  }
}
