import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm_db/res/app_colors.dart';
import 'package:mvvm_db/utils/routes.dart';
import 'package:mvvm_db/utils/routes_name.dart';
import 'package:mvvm_db/view_model/database_view_model.dart';
import 'package:mvvm_db/view_model/datepicker_view_model.dart';
import 'package:mvvm_db/view_model/getdatabase_view_model.dart';
import 'package:mvvm_db/view_model/login_view_model.dart';
import 'package:mvvm_db/view_model/remove_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => GetDateViewModel(),),
      ChangeNotifierProvider(create: (context) => DatabaseViewModel(),),
      ChangeNotifierProvider(create: (context) => LoginViewModel(),),
      ChangeNotifierProvider(create: (context) => GetAllStudentViewModel(),),
      ChangeNotifierProvider(create: (context) => RemoveViewModel(),),
    ],child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
          useMaterial3: true,
          textTheme: TextTheme(
              displaySmall: TextStyle(
                  color: txtColor,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
              titleSmall: TextStyle(
                  color: txtLinkColor,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
              titleLarge: TextStyle(
                  color: titleColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
              bodyMedium: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
          ),

      ),

      initialRoute: RoutesName.splashView,
      onGenerateRoute: Routes.onGenerateRoutes,
    ),);
  }
}
