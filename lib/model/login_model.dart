class LoginModel{
  String? email;
  String? password;

  LoginModel({required this.email, required this.password});

  LoginModel.fromMap(Map<String, dynamic>res):
      email = res["email"],
      password = res["password"];

}