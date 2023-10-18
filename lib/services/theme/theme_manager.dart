import 'package:flutter/material.dart';

class ThemeManager {
  static const mainColor = Color.fromRGBO(46, 102, 90, 1);
  static const backgroundColor = Color.fromRGBO(222, 229, 226, 1);
  static const inactiveColor = Color.fromARGB(255, 177, 184, 182);
  static const unlockedColor = Color.fromARGB(199, 119, 46, 1);

  ThemeData get getThemeDataIOS => _themeDataIOS;

  final _themeDataIOS = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(color: backgroundColor),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, fontFamily: "Manrope"),
      bodyLarge: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        fontFamily: "Manrope",
      ),
      bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: mainColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: mainColor,
      unselectedItemColor: inactiveColor,
      selectedLabelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
    ),
  );
}
