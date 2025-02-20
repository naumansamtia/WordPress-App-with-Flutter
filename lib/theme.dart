import 'package:flutter/material.dart';

class Style {
  static ThemeData get(bool isDark) {
    Color backgroundColor = isDark ? Colors.black : Colors.white;
    Color foregroundColor = isDark ? Colors.white : Colors.black;
    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      canvasColor: backgroundColor,
      primaryColor: Color(0xFF249991),
      appBarTheme: AppBarTheme(
          color: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 0,
          iconTheme: IconThemeData(color: foregroundColor), toolbarTextStyle: TextTheme(
            titleMedium: TextStyle(
              color: foregroundColor,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ).bodyMedium, titleTextStyle: TextTheme(
            titleMedium: TextStyle(
              color: foregroundColor,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ).titleLarge),
      textTheme: TextTheme(
        bodySmall: TextStyle(color: foregroundColor, fontSize: 12.0),
        bodyLarge: TextStyle(color: foregroundColor, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(
          color: foregroundColor,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          fontFamily: 'Roboto',
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(selectionColor: isDark ? Colors.white12 : Colors.grey.shade300), colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: Color(0xFF249991), brightness: isDark ? Brightness.dark : Brightness.light).copyWith(background: backgroundColor),
    );
  }
}
