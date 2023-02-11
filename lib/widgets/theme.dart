import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light,
        fontFamily: GoogleFonts.lato().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        hintColor: darkBluisColor,
        shadowColor:
            darkBluisColor, //as buttoncolor is deprecated so we used shadowcolor by assuming this variable as buttoncolor
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.lato().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkcreamcolor,
        hintColor: Colors.white,
        shadowColor:
            lightBluisColor, //as buttoncolor is deprecated so we used shadowcolor by assuming this variable as buttoncolor
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      );

  //Colors created and stored in a varibales

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamcolor = Vx.gray900;
  static Color darkBluisColor = Color(0xff403b58);
  static Color lightBluisColor = Vx.indigo500;
}
