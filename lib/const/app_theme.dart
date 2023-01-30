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
    background: const Color(0xFF7563A4),
      surface: const Color(0xFFF60606),
      primaryContainer: const Color(0xFF07E7D1),

  );

  TextTheme textScheme = const TextTheme(
    headline1: TextStyle(
      color: Color(0xFF1F1E1E),
      fontSize: 35,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
    headline2: TextStyle(
    color: Color(0xFF1F1E1E),
    fontSize: 35,
    fontWeight: FontWeight.w400,
    letterSpacing: 2.0,
  ),
    headline3: TextStyle(
      color: Color(0xFF1F1E1E),
      fontSize: 24,
      fontWeight: FontWeight.w400,
      letterSpacing: 2.0,
    ),
    bodyText1: TextStyle(
      color: Color(0xFF1F1E1E),
      fontSize: 18,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
    bodyText2: TextStyle(
      color: Color(0xFF1F1E1E),
      fontSize: 24,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
  );
  return ThemeData(
  appBarTheme: const AppBarTheme(
  color: Color.fromRGBO(99, 111, 191,1),
  foregroundColor: Color.fromRGBO(246, 246, 246, 1.0),
  ),
  scaffoldBackgroundColor: const Color(0xFFDAD8E8),
  backgroundColor: const Color(0xFFCEC6EA),
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
        color: Color(0xFFF9F9ED),
        fontSize: 35,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      headline2: TextStyle(
        color: Color(0xFFF9F9ED),
        fontSize: 35,
        fontWeight: FontWeight.w400,
        letterSpacing: 2.0,
      ),
      headline3: TextStyle(
        color: Color(0xFFF9F9ED),
        fontSize: 24,
        fontWeight: FontWeight.w400,
        letterSpacing: 2.0,
      ),
      bodyText1: TextStyle(
        color: Color(0xFFF9F9ED),
        fontSize: 18,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      bodyText2: TextStyle(
        color: Color(0xFFF9F9ED),
        fontSize: 24,
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