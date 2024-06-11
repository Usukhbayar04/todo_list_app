import 'package:flutter/material.dart';
import 'package:todolist_app/utils/colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: AppColors.brandColorLightMode,
    secondary: AppColors.blueColorLightMode,
    error: AppColors.errorColorLightMode,
    surface: AppColors.backgroundColorLightMode,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onError: AppColors.errorColorLightMode,
    onSurface: Colors.black,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.brandColor,
    secondary: AppColors.blueColor,
    error: AppColors.errorColor,
    surface: AppColors.backgroundColorDarkMode,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onError: AppColors.errorColor,
    onSurface: Colors.white,
  ),
);
