import 'package:flutter/material.dart';

ThemeMode themeFromString(String theme) {
  switch (theme) {
    case 'light':
      return ThemeMode.light;
    case 'dark':
      return ThemeMode.dark;
    case 'system':
      return ThemeMode.system;
    default:
      return ThemeMode.system;
  }
} 