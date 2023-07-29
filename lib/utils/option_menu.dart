import 'package:mvvm_db/model/munu_model.dart';
import 'package:flutter/material.dart';

class OptionMenu{
  static const List<MenuModel> firstItem = [
    logout
  ];
  static const logout = MenuModel(txt: "Logout", iconData: Icons.logout);
}