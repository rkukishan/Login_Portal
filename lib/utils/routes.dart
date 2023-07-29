import 'package:flutter/material.dart';
import 'package:mvvm_db/utils/routes_name.dart';
import 'package:mvvm_db/view/home_view.dart';
import 'package:mvvm_db/view/login_view.dart';
import 'package:mvvm_db/view/register_view.dart';
import 'package:mvvm_db/view/splash_view.dart';
import 'package:mvvm_db/res/app_all_strings.dart';

class Routes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );

      case RoutesName.loginView:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );

      case RoutesName.registerView:
        return MaterialPageRoute(
          builder: (context) => const RegisterView(),
        );

      case RoutesName.homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text(AllString.appTitleName),
            ),
            body: const Center(
              child: Text("Route Not Found"),
            ),
          ),
        );
    }
  }
}
