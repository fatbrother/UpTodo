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
        wordSpacing: -2,
      ),
      titleSmall: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: ColorSchemeFactory.textColor,
        fontFamily: "Lato",
        wordSpacing: -2,
      ),
      bodyLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        color: ColorSchemeFactory.textColor,
        fontFamily: "Lato",
        wordSpacing: -2,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: ColorSchemeFactory.textColor,
        fontFamily: "Lato",
        wordSpacing: -2,
      ),
    );
  }
}

class CategoryFactory {
  static Map<String, Image> categories = {
    'Home': Image.asset('assets/icons/categories/home.png'),
    'Work': Image.asset('assets/icons/categories/work.png'),
    'Sport': Image.asset('assets/icons/categories/sport.png'),
    'Design': Image.asset('assets/icons/categories/design.png'),
    'University': Image.asset('assets/icons/categories/university.png'),
    'Social': Image.asset('assets/icons/categories/social.png'),
    'Music': Image.asset('assets/icons/categories/music.png'),
    'Health': Image.asset('assets/icons/categories/health.png'),
    'Movie': Image.asset('assets/icons/categories/movie.png'),
  };
}

class ColorSchemeFactory {
  static const Color primaryColor = Color(0xFF000000);
  static const Color accentColor = Color(0xFF8875FF);
  static const Color backgroundColor = Color(0xFF000000);
  static const Color secondaryColor = Color(0xFF363636);
  static const Color surfaceColor = Color(0xFF363636);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color errorColor = Color(0xFFFF0000);

  static const Map<String, Color> categoriesColor = {
    'Home': Color(0xFFFFCC80),
    'Work': Color(0xFFFF9680),
    'Sport': Color(0xFF80FFFF),
    'Design': Color(0xFF80FFD9),
    'University': Color(0xFF809CFF),
    'Social': Color(0xFFFF80EB),
    'Music': Color(0xFFFC80FF),
    'Health': Color(0xFF80FFA3),
    'Movie': Color(0xFF80D1FF),
  };

  static const Map<String, Color> categoriesIconColor = {
    'Home': Color(0xFFA36200),
    'Work': Color(0xFFA31D00),
    'Sport': Color(0xFF00A32F),
    'Design': Color(0xFF00A372),
    'University': Color(0xFF0055A3),
    'Social': Color(0xFFA30089),
    'Music': Color(0xFFA000A3),
    'Health': Color(0xFF00A3A3),
    'Movie': Color(0xFF0069A3),
  };

  static ColorScheme createColorScheme() {
    return ColorScheme(
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
      onBackground: Colors.white.withOpacity(0.5),
      onError: textColor,
      brightness: Brightness.dark,
    );
  }
}
