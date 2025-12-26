import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(

    brightness: .light,
    primaryColor: AppColors.themeColor,
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        fixedSize: Size.fromWidth(double.maxFinite),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.teal,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
      contentPadding: EdgeInsets.all(16),
      border: OutlineInputBorder(borderSide: BorderSide()),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
  );
  static ThemeData get darkTheme => ThemeData(
    brightness: .dark,
    primaryColor: AppColors.themeColor,
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        fixedSize: Size.fromWidth(double.maxFinite),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.teal,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(16),
      border: OutlineInputBorder(borderSide: BorderSide()),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
  );
}
