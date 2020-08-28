import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData appTheme = ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: AppTheme.borderColor
        ),
        elevation: 0,
        color: AppTheme.backgroundColor,
      ),
      textTheme: TextTheme(
          headline6: TextStyle(fontSize: 36),
          subtitle2: TextStyle(color: textColor, fontSize: 16),
          bodyText1: TextStyle(fontSize: 18, color: Colors.grey),
          button: TextStyle(fontSize: 18, color: textOnButton)));

  static final Color backgroundColor = Colors.white;
  static final Color accentColor = Colors.deepOrange;
  static final Color textColor = Colors.grey;
  static final Color borderColor = Colors.grey;
  static final Color textOnButton = Colors.white;
}
