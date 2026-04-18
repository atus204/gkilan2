// lib/theme/app_theme.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF1A1A2E);
  static const Color secondaryColor = Color(0xFF16213E);
  static const Color accentColor = Color(0xFF0F3460);
  static const Color highlightColor = Color(0xFFE94560);
  static const Color goldColor = Color(0xFFFFC107);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color textLight = Color(0xFFF5F5F5);
  static const Color textGray = Color(0xFF9E9E9E);
  static const Color cardColor = Color(0xFF1E1E3A);
  static const Color surfaceColor = Color(0xFF252545);

  static const Color beginnerColor = Color(0xFF4CAF50);
  static const Color intermediateColor = Color(0xFF2196F3);
  static const Color advancedColor = Color(0xFFF44336);

  static const Map<String, Color> categoryColors = {
    'Grammar': Color(0xFF9C27B0),
    'Vocabulary': Color(0xFF2196F3),
    'Speaking': Color(0xFFFF5722),
    'Listening': Color(0xFF009688),
    'Writing': Color(0xFFFF9800),
    'Pronunciation': Color(0xFFE91E63),
    'Reading': Color(0xFF3F51B5),
  };

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: primaryColor,
      colorScheme: const ColorScheme.dark(
        primary: highlightColor,
        secondary: goldColor,
        surface: cardColor,
      ),

      // ✅ FIX Ở ĐÂY
      textTheme: GoogleFonts.nunitoTextTheme(
        const TextTheme(
          displayLarge: TextStyle(color: textLight, fontWeight: FontWeight.w900),
          displayMedium: TextStyle(color: textLight, fontWeight: FontWeight.w700),
          headlineLarge: TextStyle(color: textLight, fontWeight: FontWeight.w700),
          headlineMedium: TextStyle(color: textLight, fontWeight: FontWeight.w600),
          titleLarge: TextStyle(color: textLight, fontWeight: FontWeight.w600),
          titleMedium: TextStyle(color: textLight, fontWeight: FontWeight.w500),
          bodyLarge: TextStyle(color: textLight, height: 1.6),
          bodyMedium: TextStyle(color: Color(0xFFCCCCCC), height: 1.5),
          labelLarge: TextStyle(color: textLight, fontWeight: FontWeight.w600),
        ),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.nunito(
          color: textLight,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        iconTheme: const IconThemeData(color: textLight),
      ),

      cardTheme: CardThemeData(
        color: cardColor,
        elevation: 8,
        shadowColor: Colors.black38,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: surfaceColor,
        selectedColor: Color(0x4DE94560),
        labelStyle: const TextStyle(color: textLight, fontSize: 12),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        side: BorderSide.none,
      ),
    );
  }
}

class AppConstants {
  static const double cardBorderRadius = 16.0;
  static const double pagePadding = 20.0;
  static const double sectionSpacing = 24.0;
  static const Duration animationDuration = Duration(milliseconds: 300);
}