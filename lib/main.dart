import 'package:flutter/material.dart';
import 'package:myfirstproject/Screen/HomePage.dart';
import 'package:myfirstproject/Screen/cartPage.dart';
import 'package:myfirstproject/core/store.dart';
import 'package:myfirstproject/utils/Routes.dart';
import 'package:myfirstproject/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Screen/LoginPage.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home : HomePage(),
      themeMode: ThemeMode.system,
      // theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),

      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
