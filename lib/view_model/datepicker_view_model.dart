import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_db/utils/toast_msg.dart';
import 'package:image_picker/image_picker.dart';

class GetDateViewModel with ChangeNotifier {
  DateTime dateTime = DateTime.now();

  String _selectDate = "";

  String get selectDate => _selectDate;

  setDateTime(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2018),
        lastDate: DateTime(2029));

    if (newDate != null) {
      _selectDate = DateFormat.yMMMd().format(newDate);
      print(_selectDate);
      notifyListeners();
    } else {
      ToastMsg().toastMsg("Can't get Date");
    }
  }

  XFile? _img;

  String _imgPath = "";

  String get imgPath => _imgPath;

  Future<void> getImage() async {
    final selectImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectImg != null) {
      _img = selectImg;
      _imgPath = _img!.path.toString();
      print(_imgPath.toString());
      notifyListeners();
    } else {
      ToastMsg().toastMsg("Images not select !!!");
    }
  }

  setFocusNode(BuildContext context, FocusNode next) {
    FocusScope.of(context).unfocus();
    FocusScope.of(context).requestFocus(next);
    notifyListeners();
  }
}
