import 'package:flutter/material.dart';


class AppTheme {
  static ThemeData lightTheme(){
    ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromRGBO(142, 157, 204,1),
    brightness: Brightness.light,
    primary: const Color.fromRGBO(142, 157, 204,1),
    onPrimary: const Color.fromRGBO(246, 246, 246, 1.0),
    secondary: const Color.fromRGBO(99, 111, 191,1),
    onSecondary: const Color.fromRGBO(246, 246, 246, 1.0),
    tertiary: const Color.fromRGBO(65, 57, 62,1),
    onTertiary: const Color.fromRGBO(246, 246, 246, 1.0),
    //background: const Color.fromRGBO(217, 219, 241,1),
    background: const Color.fromRGBO(27, 219, 241,1),
  );

  TextTheme textScheme = const TextTheme(
    headline1: TextStyle(
      color: Color.fromRGBO(246, 6, 246, 1.0),
      fontSize: 96,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
  );
  return ThemeData(
  appBarTheme: const AppBarTheme(
  color: Color.fromRGBO(99, 111, 191,1),
  foregroundColor: Color.fromRGBO(246, 246, 246, 1.0),

  ),
  colorScheme: colorScheme,
  textTheme: textScheme,
  );
}

  static ThemeData darkTheme() {
    ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: const Color.fromRGBO(142, 157, 204,1),
      brightness: Brightness.dark,
      primary: const Color.fromRGBO(142, 157, 204,1),
      onPrimary: const Color.fromRGBO(246, 246, 246, 1.0),
      secondary: const Color.fromRGBO(99, 111, 191,1),
      onSecondary: const Color.fromRGBO(246, 246, 246, 1.0),
      tertiary: const Color.fromRGBO(65, 57, 62,1),
      onTertiary: const Color.fromRGBO(246, 246, 246, 1.0),
      //background: const Color.fromRGBO(217, 219, 241,1),
      background: const Color.fromRGBO(27, 219, 241,1),
    );

    TextTheme textScheme = const TextTheme(
      headline1: TextStyle(
        color: Color.fromRGBO(246, 6, 246, 1.0),
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
    );
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color.fromRGBO(99, 111, 191,1),
        foregroundColor: Color.fromRGBO(246, 246, 246, 1.0),

      ),
      colorScheme: colorScheme,
      textTheme: textScheme,
    );
  }
}