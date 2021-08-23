import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/app/size_config.dart';
import 'package:flutter_mvvm_boilerplate/ui/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // Add a splash image.
    return Container(
      color: Colors.white,
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // Check whether you want to go to the login screen or the home screen
    Navigator.pushNamedAndRemoveUntil(
        context, LoginScreen.routeName, (route) => false);
  }
}
