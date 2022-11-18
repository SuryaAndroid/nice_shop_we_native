
import 'package:flutter/material.dart';
import 'package:nice_shop_we_native/screens/DashboardScreen.dart';
import 'package:nice_shop_we_native/screens/LoginScreen.dart';

class RoutesName {
  // ignore: non_constant_identifier_names
  static const String LOGIN_PAGE = '/HomeScreen';
  // ignore: non_constant_identifier_names
  static const String DASHBOARD = '/DashboardScreen';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.LOGIN_PAGE:
        return _GeneratePageRoute(
            widget: LoginScreen(), routeName: settings.name!);
      case RoutesName.DASHBOARD:
        return _GeneratePageRoute(
            widget: DashboardScreen(), routeName: settings.name!);
      default:
        return _GeneratePageRoute(
            widget: LoginScreen(), routeName: settings.name!);
    }
  }
}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String routeName;
  _GeneratePageRoute({required this.widget, required this.routeName})
      : super(
      settings: RouteSettings(name: routeName),
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionDuration: Duration(milliseconds: 500),
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) {
        return SlideTransition(
          textDirection: TextDirection.rtl,
          position: Tween<Offset>(
            begin: Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      });
}