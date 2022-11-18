import 'package:flutter/material.dart';
import 'package:nice_shop_we_native/screens/HomeSreen.dart';

import 'navigation/navigations.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => HomePage(child: child!),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RoutesName.LOGIN_PAGE,
    );
  }
}
