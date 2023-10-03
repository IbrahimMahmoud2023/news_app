import 'package:flutter/material.dart';
import 'package:news_app/shared_component/theme/colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 1,
      color: primaryColor,
      toolbarHeight: 100,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      )),
    ),
  );
}
