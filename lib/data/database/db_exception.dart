class AppException implements Exception {
  String? _msg;
  String? _msgs;

  AppException([this._msg, this._msgs]);

  @override
  String toString() {
    return 'AppException{msg: $_msg}';
  }
}

class UserNotFoundError extends AppException {
  UserNotFoundError([String? msg]) : super(msg, "User Not Found");
}
