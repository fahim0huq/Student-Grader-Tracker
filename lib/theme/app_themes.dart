import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData lightTheme = _buildTheme(
    brightness: Brightness.light,
    scaffold: const Color(0xFFF4F6FB),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF3D5AFE),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFF00BFA5),
      onSecondary: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF1B1B2F),
      error: Color(0xFFD32F2F),
      onError: Color(0xFFFFFFFF),
    ),
  );

  static final ThemeData darkTheme = _buildTheme(
    brightness: Brightness.dark,
    scaffold: const Color(0xFF121221),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF8C9EFF),
      onPrimary: Color(0xFF0A0A1A),
      secondary: Color(0xFF1DE9B6),
      onSecondary: Color(0xFF0A0A1A),
      surface: Color(0xFF1E1E33),
      onSurface: Color(0xFFECECF5),
      error: Color(0xFFEF9A9A),
      onError: Color(0xFF1A0000),
    ),
  );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required Color scaffold,
    required ColorScheme colorScheme,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffold,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurface.withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.onSurface.withOpacity(0.2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.onSurface.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}