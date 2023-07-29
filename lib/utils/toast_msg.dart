import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm_db/res/app_colors.dart';

class ToastMsg {
  void toastMsg(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        textColor: whiteColor,
        fontSize: 14,
        backgroundColor: Colors.black);
  }
}
