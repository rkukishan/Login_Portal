import 'dart:io';
import 'package:mvvm_db/data/database/database_variable.dart';
import 'package:mvvm_db/data/database/db_helper.dart';
import 'package:mvvm_db/model/login_model.dart';
import 'package:mvvm_db/model/student_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class InsertStudent {
  Future<StudentModel> insertValue(StudentModel studentModel) async {
    final dbClient = await DBHelper.appDatabase; // 1
    // Database? dbClients = await DBHelper.appDatabase; //2 this is same for 1 and 2
    await dbClient!.insert(AppVariable.tblName, studentModel.toMap());
    return studentModel;
  }
}
