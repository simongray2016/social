import 'package:flutter/material.dart';
import 'package:social/constant/colors.dart';

class AppTheme {
  static ThemeData dark() {
    return ThemeData(
      fontFamily: 'HKGrotesk',
      primaryColor: kDarkBlack,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: kDarkBlack,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(elevation: 0),
      accentColor: kDarkBlack,
      dividerTheme: DividerThemeData(color: kGray),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: kWhite,
        ),
        headline2: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: kWhite,
        ),
        headline3: TextStyle(
          fontSize: 14,
          color: kLightGray,
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          color: kLightWhite,
        ),
        bodyText2: TextStyle(
          fontSize: 14,
          color: kWhite,
        ),
      ),
    );
  }
}
