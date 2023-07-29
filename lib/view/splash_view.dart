import 'package:flutter/material.dart';
import 'package:mvvm_db/res/app_colors.dart';
import 'package:mvvm_db/view_model/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashViewModel splashViewModel = SplashViewModel();

  @override
  void initState() {
    splashViewModel.splashViewHold(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(""),
        ),
        body: const Center(
            child: FlutterLogo(
          size: 100.0,
          curve: Curves.bounceInOut,
        )));
  }
}
