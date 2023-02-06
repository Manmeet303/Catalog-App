import 'package:flutter/material.dart';
import 'package:myfirstproject/Screen/HomePage.dart';
import 'package:myfirstproject/utils/Routes.dart';
import 'package:myfirstproject/widgets/theme.dart';

import 'Screen/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home : HomePage(),
      theme: MyTheme.lightThemeData,
      // darkTheme: MyTheme.darkThemeData,

      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
