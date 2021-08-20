import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm_boilerplate/app/const.dart';
import 'package:flutter_mvvm_boilerplate/app/locator.dart';
import 'package:flutter_mvvm_boilerplate/app/navigation_service.dart';
import 'package:flutter_mvvm_boilerplate/app/routes.dart';
import 'package:flutter_mvvm_boilerplate/app/util/dev_http.dart';
import 'package:flutter_mvvm_boilerplate/provider/login_provider.dart';
import 'package:flutter_mvvm_boilerplate/provider/user_provider.dart';
import 'package:flutter_mvvm_boilerplate/ui/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  if (kDebugMode) {
    HttpOverrides.global = new DevHttpOverrides();
  }

  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MultiProvider(providers: [
      ChangeNotifierProvider.value(value: LoginProvider()),
      ChangeNotifierProvider.value(value: UserProvider()),
    ], child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter MVVM Boilerplate',
      navigatorKey: locator<NavigationService>().key,
      theme: ThemeData(
        primarySwatch: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: kAccentColor,
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
