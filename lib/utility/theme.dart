import "package:flutter/material.dart";

class ThemeFactory {
  static ThemeData createThemeData() {
    return ThemeData(
      colorScheme: ColorSchemeFactory.createColorScheme(),
      textTheme: TextThemeFactory.createTextTheme(),
      useMaterial3: true,
    );
  }
}

class TextThemeFactory {
  static TextTheme createTextTheme() {
    return const TextTheme(
      titleLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: ColorSchemeFactory.textColor,
        fontFamily: "Lato",
      ),
      titleSmall: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: ColorSchemeFactory.textColor,
        fontFamily: "Lato",
      ),
      bodyLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: ColorSchemeFactory.textColor,
        fontFamily: "Lato",
      ),
      bodySmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: ColorSchemeFactory.textColor,
        fontFamily: "Lato",
      ),
    );
  }
}

class ColorSchemeFactory {
  static const Color primaryColor = Color(0xFF000000);
  static const Color accentColor = Color(0xFF8875FF);
  static const Color backgroundColor = Color(0xFF000000);
  static const Color secondaryColor = Color(0xFF363636);
  static const Color surfaceColor = Color(0xFF363636);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color errorColor = Color(0xFFFF0000);

  static ColorScheme createColorScheme() {
    return const ColorScheme(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surfaceColor,
      tertiary: accentColor,
      background: backgroundColor,
      error: errorColor,
      onPrimary: textColor,
      onSecondary: textColor,
      onTertiary: textColor,
      onSurface: textColor,
      onBackground: secondaryColor,
      onError: textColor,
      brightness: Brightness.dark,
    );
  }
}
