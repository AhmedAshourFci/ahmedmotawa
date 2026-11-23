import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // AM Labs Palette - Deep Navy & Electric Blue
  static const Color primary = Color(0xFF0A0E1A);
  static const Color secondary = Color(0xFF0F1629);
  static const Color accent = Color(0xFF00A8FF);
  static const Color accentLight = Color(0xFF4DC3FF);
  static const Color accentDark = Color(0xFF0077B6);

  // Gradients
  static const Color gradientStart = Color(0xFF0A0E1A);
  static const Color gradientEnd = Color(0xFF0F1629);
  static const Color cardGradientStart = Color(0xFF0F1629);
  static const Color cardGradientEnd = Color(0xFF1A2342);

  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0BEC5);
  static const Color textMuted = Color(0xFF6B7B8C);

  // Background
  static const Color background = Color(0xFF0A0E1A);
  static const Color surface = Color(0xFF0F1629);
  static const Color cardBg = Color(0xFF0F1629);
  static const Color cardBgLight = Color(0xFF151D35);

  // Status
  static const Color success = Color(0xFF00C853);
  static const Color error = Color(0xFFFF1744);
  static const Color warning = Color(0xFFFF9100);

  // Glass Effect
  static const Color glassBg = Color(0x0DFFFFFF);
  static const Color glassBorder = Color(0x1AFFFFFF);

  // Glow
  static const Color glowBlue = Color(0x3300A8FF);
}

class AppTheme {
  static ThemeData darkTheme([Locale? locale]) {
    final isArabic = locale?.languageCode == 'ar';
    TextStyle font({
      required double fontSize,
      FontWeight fontWeight = FontWeight.normal,
      Color color = AppColors.textPrimary,
      double? letterSpacing,
      double? height,
    }) {
      if (isArabic) {
        return GoogleFonts.cairo(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          letterSpacing: letterSpacing,
          height: height,
        );
      }
      return GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
      );
    }

    final baseText = isArabic
        ? GoogleFonts.cairoTextTheme(ThemeData.dark().textTheme)
        : GoogleFonts.interTextTheme(ThemeData.dark().textTheme);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.accent,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accent,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        onPrimary: AppColors.primary,
        onSecondary: AppColors.textPrimary,
        onSurface: AppColors.textPrimary,
      ),
      textTheme: baseText.copyWith(
        displayLarge: font(
          fontSize: isArabic ? 52 : 64,
          fontWeight: FontWeight.bold,
          letterSpacing: isArabic ? 0 : -2,
        ),
        displayMedium: font(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          letterSpacing: isArabic ? 0 : -1.5,
        ),
        displaySmall: font(
          fontSize: 36,
          fontWeight: FontWeight.w700,
          letterSpacing: isArabic ? 0 : -1,
        ),
        headlineLarge: font(fontSize: 32, fontWeight: FontWeight.w700),
        headlineMedium: font(fontSize: 28, fontWeight: FontWeight.w600),
        headlineSmall: font(fontSize: 24, fontWeight: FontWeight.w600),
        titleLarge: font(fontSize: 22, fontWeight: FontWeight.w600),
        titleMedium: font(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
        titleSmall: font(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textMuted,
        ),
        bodyLarge: font(
          fontSize: 18,
          color: AppColors.textSecondary,
          height: 1.7,
        ),
        bodyMedium: font(
          fontSize: 16,
          color: AppColors.textSecondary,
          height: 1.55,
        ),
        bodySmall: font(
          fontSize: 14,
          color: AppColors.textMuted,
          height: 1.4,
        ),
        labelLarge: font(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.accent,
          letterSpacing: 0.5,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: font(fontSize: 16, fontWeight: FontWeight.w600),
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.accent,
          side: const BorderSide(color: AppColors.accent, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: font(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.cardBg,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.glassBorder,
        thickness: 1,
      ),
    );
  }

  static ThemeData lightTheme([Locale? locale]) => darkTheme(locale);
}

class AppGradients {
  static const LinearGradient primary = LinearGradient(
    colors: [AppColors.gradientStart, AppColors.gradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient card = LinearGradient(
    colors: [AppColors.cardGradientStart, AppColors.cardGradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accent = LinearGradient(
    colors: [AppColors.accent, AppColors.accentLight],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient heroGlow = LinearGradient(
    colors: [Color(0xFF00A8FF), Color(0xFF0066CC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient glass = LinearGradient(
    colors: [
      AppColors.glassBg,
      AppColors.glassBg.withValues(alpha: 0.3),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient blueGlow = LinearGradient(
    colors: [Color(0x1A00A8FF), Colors.transparent],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class AppShadows {
  static BoxShadow get card => BoxShadow(
    color: AppColors.accent.withValues(alpha: 0.08),
    blurRadius: 30,
    offset: const Offset(0, 8),
    spreadRadius: 0,
  );

  static BoxShadow get elevated => BoxShadow(
    color: Colors.black.withValues(alpha: 0.4),
    blurRadius: 40,
    offset: const Offset(0, 20),
    spreadRadius: 5,
  );

  static BoxShadow get glow => BoxShadow(
    color: AppColors.accent.withValues(alpha: 0.3),
    blurRadius: 60,
    offset: const Offset(0, 0),
    spreadRadius: 5,
  );

  static BoxShadow get buttonGlow => BoxShadow(
    color: AppColors.accent.withValues(alpha: 0.4),
    blurRadius: 20,
    offset: const Offset(0, 4),
    spreadRadius: 0,
  );
}
