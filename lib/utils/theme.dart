import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      surface: Colors.white,
      primary: const Color(0xFFF1411B),
      secondary: Colors.grey.shade200,
      surfaceDim: Colors.grey,
      inversePrimary: Colors.black),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      surface: const Color(0xFF121212),
      primary: const Color(0xFFF0370F),
      secondary: Colors.grey.shade900,
      surfaceDim: Colors.grey.shade800,
      inversePrimary: Colors.white),
);
