import 'package:app_demo/utils/colors.dart';
import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    appBarTheme: const AppBarTheme(color: Colors.white),
    brightness: Brightness.light,
    buttonTheme: const ButtonThemeData(
      buttonColor: kPrimaryDark,
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.normal,
    ),
  );

  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: kPrimaryDark,
    appBarTheme: const AppBarTheme(color: kHighGrey),
    brightness: Brightness.dark,
    buttonTheme: const ButtonThemeData(
      buttonColor: kPrimaryDark,
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.normal,
    ),
  );
}
