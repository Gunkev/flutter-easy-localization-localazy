import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData light() {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.teal,
          brightness: Brightness.light,
        ).copyWith(
          primary: AppColors.teal,
          secondary: AppColors.coral,
          tertiary: AppColors.blue,
          surface: AppColors.surface,
          onSurface: AppColors.ink,
        );

    final baseTheme = ThemeData(colorScheme: colorScheme, useMaterial3: true);

    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.navy,
      useMaterial3: true,
      textTheme: GoogleFonts.interTextTheme(baseTheme.textTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.appBarSurface,
        elevation: 0,
        foregroundColor: AppColors.surface,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    );
  }
}
