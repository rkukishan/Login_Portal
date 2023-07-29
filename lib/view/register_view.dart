import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mvvm_db/model/student_model.dart';
import 'package:mvvm_db/res/app_all_strings.dart';
import 'package:mvvm_db/res/app_colors.dart';
import 'package:mvvm_db/res/components/sizebox_height.dart';
import 'package:mvvm_db/utils/routes_name.dart';
import 'package:mvvm_db/utils/toast_msg.dart';
import 'package:mvvm_db/view_model/datepicker_view_model.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_db/view_model/database_view_model.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailController =
      TextEditingController(text: "sagar@gmail.com");

  TextEditingController passwordController =
      TextEditingController(text: "sagar");

  TextEditingController nameController = TextEditingController(text: "sagar");

  TextEditingController classController = TextEditingController(text: "A-103");

  TextEditingController branchController = TextEditingController(text: "bca");

  TextEditingController imageController = TextEditingController();

  TextEditingController rnoController = TextEditingController(text: "46");

  TextEditingController resultController = TextEditingController(text: "0");

  TextEditingController birthDateController = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode classFocusNode = FocusNode();
  FocusNode branchFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    resultController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        title: Text(AllString.appTitleName,
            style: Theme.of(context).textTheme.bodyMedium),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Consumer<GetDateViewModel>(
              builder: (context, value, child) {
                birthDateController.text = value.selectDate.toString();
                imageController.text = value.imgPath.toString();
                return Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _globalKey,
                  child: Column(
                    children: [
                      SizeBoxHeight(height: 20.0),
                      Text(
                        AllString.registerHere,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizeBoxHeight(height: 20.0),
                      TextFormField(
                          autofocus: true,
                          style: TextStyle(color: txtColor),
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required"),
                            EmailValidator(errorText: "Not Valid")
                          ]),
                          focusNode: emailFocusNode,
                          onFieldSubmitted: (values) {
                            value.setFocusNode(context, passwordFocusNode);
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Email",
                            prefixIcon: Icon(
                              Icons.email,
                              color: inputBorderColor,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.clear,
                                color: themeColor,
                              ),
                              onPressed: () {
                                emailController.text = "";
                              },
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    width: 2.0, color: inputBorderColor)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    width: 2.0, color: inputBorderColor)),
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
                          focusNode: passwordFocusNode,
                          onFieldSubmitted: (values) {
                            value.setFocusNode(context, nameFocusNode);
                          },
                          validator: MultiValidator(
                              [MinLengthValidator(3, errorText: "To Short")]),
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: inputBorderColor,
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    width: 2.0, color: inputBorderColor)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    width: 2.0, color: inputBorderColor)),
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
                          controller: nameController,
                          focusNode: nameFocusNode,
                          onFieldSubmitted: (values) {
                            value.setFocusNode(context, classFocusNode);
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Name",
                            prefixIcon: Icon(
                              Icons.person,
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
                          controller: classController,
                          onFieldSubmitted: (values) {
                            value.setFocusNode(context, branchFocusNode);
                          },
                          focusNode: classFocusNode,
                          decoration: InputDecoration(
                            hintText: "Enter Class",
                            prefixIcon: Icon(
                              Icons.class_,
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
                          controller: branchController,
                          focusNode: branchFocusNode,
                          decoration: InputDecoration(
                            hintText: "Enter Branch",
                            prefixIcon: Icon(
                              Icons.branding_watermark,
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
                          readOnly: true,
                          style: TextStyle(color: txtColor),
                          onTap: () async {
                            await value.getImage();
                          },
                          controller: imageController,
                          decoration: InputDecoration(
                            hintText: "Select Images",
                            prefixIcon: Icon(
                              Icons.image,
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
                          keyboardType: TextInputType.number,
                          controller: rnoController,
                          decoration: InputDecoration(
                            hintText: "Enter Roll No",
                            prefixIcon: Icon(
                              Icons.numbers,
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
                          keyboardType: TextInputType.number,
                          controller: resultController,
                          decoration: InputDecoration(
                            hintText: "Enter 0 or 1",
                            prefixIcon: Icon(
                              Icons.numbers,
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
                          controller: birthDateController,
                          readOnly: true,
                          onTap: () {
                            value.setDateTime(context);
                          },
                          decoration: InputDecoration(
                            hintText: "Choose Date",
                            prefixIcon: Icon(
                              Icons.calendar_month,
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
                      Consumer<DatabaseViewModel>(
                        builder: (context, value, child) {
                          return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: btnBgColor),
                              onPressed: () {
                                if (_globalKey.currentState!.validate()) {
                                  value.setInsertData(StudentModel(
                                      studentEmail: emailController.text,
                                      studentPassword: passwordController.text,
                                      studentName: nameController.text,
                                      studentClass: classController.text,
                                      studentBranch: branchController.text,
                                      studentImage: imageController.text,
                                      studentRollNo:
                                          int.parse(rnoController.text),
                                      studentResult:
                                          int.parse(resultController.text),
                                      studentBirthDate:
                                          birthDateController.text));
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      RoutesName.loginView, (route) => false);
                                } else {
                                  ToastMsg().toastMsg("Filled Empty");
                                }
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(color: whiteColor),
                              ));
                        },
                      ),
                      SizeBoxHeight(height: 20.0),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
