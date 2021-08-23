import 'package:flutter/material.dart';
import 'package:flutter_mvvm_boilerplate/ui/home/home_screen.dart';
import 'package:flutter_mvvm_boilerplate/ui/login/login_screen.dart';
import 'package:flutter_mvvm_boilerplate/ui/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
