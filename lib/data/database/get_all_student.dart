import 'dart:io';
import 'package:mvvm_db/data/database/database_variable.dart';
import 'package:mvvm_db/data/database/db_helper.dart';
import 'package:mvvm_db/model/login_model.dart';
import 'package:mvvm_db/model/student_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class GetAllStudent{

  Future<List<StudentModel>> getAllStudent(int limitData)async{
    final dbClient = await DBHelper.appDatabase;

    List<Map<String, dynamic>> queryResult = await dbClient!.query(AppVariable.tblName,limit: limitData);

    print(queryResult);

    return queryResult.map((e) => StudentModel.fromMap(e)).toList();
  }

}