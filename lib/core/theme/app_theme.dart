import 'package:flutter/material.dart';
import 'package:todo_app/core/core.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    colorScheme: ColorScheme.light(
      primary: AppColor.purple,
      secondary: AppColor.darkPurple,
      tertiary: AppColor.pinkPurple,
      onPrimary: AppColor.white,
      onSurface: AppColor.black,
      onSecondary: AppColor.lighGray,
    ),
    textTheme: TextTheme(
      headlineLarge: AppTypography.headlineLarge,
      headlineMedium: AppTypography.headlineMedium,
      bodyMedium: AppTypography.bodyMedium,
      bodyLarge: AppTypography.bodyLarge,
    )
  );
}