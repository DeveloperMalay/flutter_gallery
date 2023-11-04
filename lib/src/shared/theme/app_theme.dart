part of '../shared.dart';

abstract class BaseColorScheme {
  Color getPrimaryColor();

  Color getSecondaryColor();

  Color getErrorColor();

  Color getBackgroundColor();

  Color getPrimaryTextColor();

  Color getSecondaryTextColor();
}

class AppTheme {
  static ThemeData getThemeData({bool isDark = false}) {
    return isDark ? dark() : light();
  }

  static final AppDarkScheme _darkScheme = AppDarkScheme();
  static final AppLightScheme _lightScheme = AppLightScheme();

  static ThemeData dark() {
    return ThemeData(
      primaryColor: _darkScheme.getPrimaryColor(),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        background: _darkScheme.getBackgroundColor(),
        error: _darkScheme.getErrorColor(),
        primary: _darkScheme.getPrimaryColor(),
        secondary: _darkScheme.getSecondaryColor(),
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: _lightScheme.getBackgroundColor(),
      textTheme: GoogleFonts.latoTextTheme().copyWith(
        titleSmall: TextStyle(
          color: _darkScheme.getPrimaryTextColor(),
        ),
        titleMedium: TextStyle(
          color: _darkScheme.getPrimaryTextColor(),
        ),
        titleLarge: TextStyle(
          color: _darkScheme.getPrimaryTextColor(),
        ),
        displayLarge: TextStyle(
          color: _darkScheme.getPrimaryTextColor(),
        ),
        displayMedium: TextStyle(
          color: _darkScheme.getPrimaryTextColor(),
        ),
        displaySmall: TextStyle(
          color: _darkScheme.getPrimaryTextColor(),
        ),
        bodyLarge: TextStyle(
          color: _darkScheme.getPrimaryTextColor(),
        ),
        bodyMedium: TextStyle(
          color: _darkScheme.getPrimaryTextColor(),
        ),
        bodySmall: TextStyle(
          color: _darkScheme.getPrimaryTextColor(),
        ),
        labelLarge: TextStyle(
          color: _darkScheme.getPrimaryTextColor(),
        ),
        labelMedium: TextStyle(
          color: _darkScheme.getPrimaryTextColor(),
        ),
        labelSmall: TextStyle(
          color: _darkScheme.getPrimaryTextColor(),
        ),
      ),
    );
  }

  static ThemeData light() {
    return ThemeData(
      primaryColor: _lightScheme.getPrimaryColor(),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        background: _lightScheme.getBackgroundColor(),
        error: _lightScheme.getErrorColor(),
        primary: _lightScheme.getPrimaryColor(),
        secondary: _lightScheme.getSecondaryColor(),
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: _lightScheme.getBackgroundColor(),
      textTheme: GoogleFonts.latoTextTheme().copyWith(
        titleSmall: TextStyle(
          color: _lightScheme.getPrimaryTextColor(),
        ),
        titleMedium: TextStyle(
          color: _lightScheme.getPrimaryTextColor(),
        ),
        titleLarge: TextStyle(
          color: _lightScheme.getPrimaryTextColor(),
        ),
        displayLarge: TextStyle(
          color: _lightScheme.getPrimaryTextColor(),
        ),
        displayMedium: TextStyle(
          color: _lightScheme.getPrimaryTextColor(),
        ),
        displaySmall: TextStyle(
          color: _lightScheme.getPrimaryTextColor(),
        ),
        bodyLarge: TextStyle(
          color: _lightScheme.getPrimaryTextColor(),
        ),
        bodyMedium: TextStyle(
          color: _lightScheme.getPrimaryTextColor(),
        ),
        bodySmall: TextStyle(
          color: _lightScheme.getPrimaryTextColor(),
        ),
        labelLarge: TextStyle(
          color: _lightScheme.getPrimaryTextColor(),
        ),
        labelMedium: TextStyle(
          color: _lightScheme.getPrimaryTextColor(),
        ),
        labelSmall: TextStyle(
          color: _lightScheme.getPrimaryTextColor(),
        ),
      ),
    );
  }
}

class AppLightScheme extends BaseColorScheme {
  static AppLightScheme? _instance;

  factory AppLightScheme() {
    _instance ??= AppLightScheme._internal();
    return _instance!;
  }

  AppLightScheme._internal();

  @override
  Color getBackgroundColor() {
    return MColorScheme.backgroundColor;
  }

  @override
  Color getErrorColor() {
    return const Color(0xFFE57373);
  }

  @override
  Color getPrimaryColor() {
    return MColorScheme.primaryColor;
  }

  @override
  Color getPrimaryTextColor() {
    return MColorScheme.primaryTextColor;
  }

  @override
  Color getSecondaryColor() {
    return MColorScheme.secondaryColor;
  }

  @override
  Color getSecondaryTextColor() {
    return MColorScheme.secondaryTextColor;
  }
}

class AppDarkScheme extends BaseColorScheme {
  static AppDarkScheme? _instance;

  factory AppDarkScheme() {
    _instance ??= AppDarkScheme._internal();
    return _instance!;
  }

  AppDarkScheme._internal();

  @override
  Color getBackgroundColor() {
    return '#FAF6FF'.toColor();
  }

  @override
  Color getErrorColor() {
    return const Color(0xFFE57373);
  }

  @override
  Color getPrimaryColor() {
    return const Color(0xFF2196F3);
  }

  @override
  Color getPrimaryTextColor() {
    return const Color(0xFF000000);
  }

  @override
  Color getSecondaryColor() {
    return const Color(0xFFE91E63);
  }

  @override
  Color getSecondaryTextColor() {
    return const Color(0xFF000000);
  }
}
