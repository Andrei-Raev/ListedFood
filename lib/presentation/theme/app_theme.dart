import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

// Тема для светлого режима
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme(
    brightness: Brightness.light,

    primary: primaryA0,
    onPrimary: Colors.white,

    // primaryContainer: primaryA10,
    secondary: secondaryColor,
    onSecondary: Colors.black,

    // secondaryContainer: accentColor,
    surface: Colors.white,
    onSurface: Colors.black,

    error: Colors.red,
    onError: Colors.white,
  ),
  primaryColor: primaryA0,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: primaryA0,
    foregroundColor: Colors.white,
  ),

  textTheme: textTheme,
);

// Тема для темного режима
ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,

    primary: primaryA10,
    onPrimary: Colors.white,

    // primaryContainer: primaryA10,
    secondary: secondaryColor,
    onSecondary: Colors.white,

    // secondaryContainer: accentColor,
    surface: Colors.black,
    onSurface: Colors.white,

    error: Colors.red,
    onError: Colors.white,
  ),
  appBarTheme: AppBarTheme(backgroundColor: primaryA50),

  textTheme: textTheme,
); 