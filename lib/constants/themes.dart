import 'package:flutter/material.dart';

// Определение цветов из палитры
const Color primaryA0 = Color(0xFF2C53F2);
const Color primaryA10 = Color(0xFF2C45C5);
const Color primaryA20 = Color(0xFF2A389B);
const Color primaryA30 = Color(0xFF252B72);
const Color primaryA40 = Color(0xFF1E1F4B);
const Color primaryA50 = Color(0xFF151328);

const Color secondaryColor = Color(0xFFF4F5FB);
const Color accentColor = Color(0xFF0FB7E6);

/* Fonts */
const TextTheme textTheme = TextTheme(
  bodyMedium: TextStyle(fontSize: 16),
  titleLarge: TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.bold,
    fontFamily: 'Brotesk',
  ),
);

const inputDecoration = InputDecoration(
  isDense: true,
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 1),
  ),
);
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

// --== Темы шрифтов ==--
