import 'package:flutter/material.dart';
import 'package:social/constant/colors.dart';

class AppTheme {
  static ThemeData dark() {
    return ThemeData(
      fontFamily: 'HKGrotesk',
      primaryColor: kDarkBlack,
      scaffoldBackgroundColor: kDarkBlack,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(elevation: 0),
    );
  }
}
