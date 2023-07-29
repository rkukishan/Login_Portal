import 'dart:io';
import 'package:mvvm_db/data/database/database_variable.dart';
import 'package:mvvm_db/model/login_model.dart';
import 'package:mvvm_db/model/student_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? db;

  static Future<Database?> get appDatabase async {
    if (db != null) {
      return db;
    } else {
      return db = await initDB();
    }
  }

  static initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, AppVariable.dbName);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  static _onCreate(Database db, int version) async {
    await db.execute('''
    create table ${AppVariable.tblName} (
    ${AppVariable.studentId} integer primary key,
    ${AppVariable.studentEmail} text,
    ${AppVariable.studentPassword} text,
    ${AppVariable.studentName} text,
    ${AppVariable.studentClass} text,
    ${AppVariable.studentBranch} text,
    ${AppVariable.studentImage} text,
    ${AppVariable.studentRollNo} integer,
    ${AppVariable.studentResult} integer,
    ${AppVariable.studentBirthDate} timestamp)    
    ''');
  }
}
