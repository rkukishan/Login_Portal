import 'dart:io';
import 'package:mvvm_db/data/database/database_variable.dart';
import 'package:mvvm_db/data/database/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class RemoveStudent {
  Future<int> removeValue(String email) async {
    // final dbClient = await DBHelper.appDatabase; // 1
    Database? dbClients =
        await DBHelper.appDatabase; //2 this is same for 1 and 2
    return await dbClients!
        .delete(AppVariable.tblName, where: '${AppVariable.studentEmail} = ?', whereArgs: [email]);
  }
}
