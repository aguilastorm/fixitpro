import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromRGBO(180, 180, 0, 1);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      // Primary Color
      primaryColor: primary,

      // AppBar Theme
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),

      // TextButton Theme
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primary)),
      // ElevatedButtons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromHeight(40),
            backgroundColor: primary,
            shape: const StadiumBorder(),
            elevation: 0),
      ),

      // OutlinedButtons
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              shape: const StadiumBorder(), elevation: 0)),
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: TextStyle(color: primary),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
      datePickerTheme: const DatePickerThemeData(
          headerBackgroundColor: primary,
          todayBackgroundColor: MaterialStatePropertyAll(primary)));
  // TODO: Complete DatePicker Style
}
