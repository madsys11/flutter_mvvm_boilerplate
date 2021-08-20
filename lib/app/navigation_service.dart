import 'package:flutter/material.dart';

abstract class NavigationService {
  get key;

  void pop({Object arguments});
  Future<dynamic> pushNamed(String routeName, {Object arguments});
  Future<dynamic> pushNamedAndRemoveAll(String routeName, {Object arguments});
}

class NavigationServiceImplementation extends NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  get key => _navigatorKey;

  @override
  void pop({Object? arguments}) {
    return _navigatorKey.currentState!.pop();
  }

  @override
  Future pushNamed(String routeName, {Object? arguments}) {
    return _navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  @override
  Future pushNamedAndRemoveAll(String routeName, {Object? arguments}) {
    return _navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }
}
