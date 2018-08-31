import 'package:flutter/material.dart';

class Themes {
  const Themes._(this.name, this.data);

  final String name;
  final ThemeData data;
}

final darkTheme = Themes._("Dark", _buildDarkTheme());
final lightTheme = Themes._("Light", _buildLightTheme());

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
      title: base.title.copyWith(
          fontFamily: "Rubik"
      )
  );
}

ThemeData _buildDarkTheme() {
  const Color primaryColor = const Color(0xFFFFC107);
  final ThemeData base = new ThemeData.dark();
  return base.copyWith(
    primaryColor: primaryColor,
    buttonColor: const Color(0xFF76FF03),
    indicatorColor: Colors.white,
    accentColor: const Color(0xFFE040FB),
    canvasColor: const Color(0xFF202124),
    scaffoldBackgroundColor: const Color(0xFF202124),
    backgroundColor: const Color(0xFF202124),
    errorColor: const Color(0xFFB00020),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}

ThemeData _buildLightTheme() {
  const Color primaryColor = const Color(0xFF2C2B33);
  final ThemeData base = new ThemeData.light();
  return base.copyWith(
    primaryColor: primaryColor,
    buttonColor: const Color(0xFF76FF03),
    indicatorColor: Colors.white,
    accentColor: const Color(0xFFE040FB),
    canvasColor: const Color(0xFFFFFFFF),
    backgroundColor: const Color(0xFFFFF9C4),
    errorColor: const Color(0xFFB00020),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}