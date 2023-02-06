import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData get lightThemeData => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );
  static ThemeData get darkThemeData => ThemeData(
        brightness: Brightness.dark,
      );

  //Colors created and stored in a varibales

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluisColor = Color(0xff403b58);
}
