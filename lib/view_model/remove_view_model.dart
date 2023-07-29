import 'package:flutter/foundation.dart';
import 'package:mvvm_db/data/database/remove_student.dart';

class RemoveViewModel with ChangeNotifier{
  RemoveStudent removeStudent = RemoveStudent();

  Future<void> removeStudents(String email)async{
      removeStudent.removeValue(email);
      notifyListeners();
  }

}