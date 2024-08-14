import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(
        255,
        243,
        243,
        243,
      ),
      fontFamily: "Muli",
      appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
    );
  }
}
