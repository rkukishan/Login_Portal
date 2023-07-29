import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_db/data/database/db_helper.dart';
import 'package:mvvm_db/model/login_model.dart';
import 'package:mvvm_db/res/app_all_strings.dart';
import 'package:mvvm_db/res/app_colors.dart';
import 'package:mvvm_db/res/components/sizebox_height.dart';
import 'package:mvvm_db/utils/routes_name.dart';
import 'package:mvvm_db/utils/toast_msg.dart';
import 'package:mvvm_db/view_model/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController =
      TextEditingController(text: "kishan@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "kishan");

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  LoginViewModel? loginViewModel;

  @override
  void initState() {
    loginViewModel = LoginViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text(AllString.appTitleName, style: Theme.of(context).textTheme.bodyMedium,),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Form(
                key: _globalKey,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Login Here",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizeBoxHeight(height: 20.0),
                    TextFormField(
                      style: TextStyle(color: txtColor),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: inputBorderColor,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  width: 2.0, color: inputBorderColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  width: 2.0, color: inputBorderColor)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  width: 2.0, color: inputBorderColor)),
                        )),
                    SizeBoxHeight(height: 20.0),
                    TextFormField(
                        style: TextStyle(color: txtColor),
                        keyboardType: TextInputType.text,
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: inputBorderColor,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  width: 2.0, color: inputBorderColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  width: 2.0, color: inputBorderColor)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  width: 2.0, color: inputBorderColor)),
                        )),
                    SizeBoxHeight(height: 20.0),
                    ElevatedButton(
                        onPressed: () async {
                          bool isChk = await loginViewModel!.loginStudent(
                              LoginModel(
                                  email: emailController.text,
                                  password: passwordController.text));

                          if (isChk == true) {
                            Navigator.pushNamed(context, RoutesName.homeView);
                          } else {
                            ToastMsg().toastMsg("Username Invalid");
                          }
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: btnBgColor),
                        child: Text(AllString.login,style: TextStyle(color: whiteColor),)),
                    SizeBoxHeight(height: 20.0),
                    Text.rich(TextSpan(
                        text: "You have not account? ",
                        style: Theme.of(context).textTheme.displaySmall,
                        children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, RoutesName.registerView);
                                },
                              text: "Register",
                              style: Theme.of(context).textTheme.titleSmall)
                        ]))
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
