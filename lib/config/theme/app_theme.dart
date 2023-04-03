import 'package:flutter/material.dart';

const Color customColor = Color(0xFF1E1E1E);

const List<Color> colorTheme = [
  Colors.blue,
  Colors.red,
];

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorTheme[0],
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
    );
  }
}
