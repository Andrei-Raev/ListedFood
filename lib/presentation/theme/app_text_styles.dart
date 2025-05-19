import 'package:flutter/material.dart';

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