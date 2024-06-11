import 'package:flutter/material.dart';
import 'colors.dart';

class AppFonts {
  static TextStyle headline1(BuildContext context) {
    return TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).textTheme.displayLarge?.color,
    );
  }

  static TextStyle headline2(BuildContext context) {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).textTheme.displayMedium?.color,
    );
  }

  static TextStyle bodyText1(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).textTheme.bodyLarge?.color,
    );
  }

  static TextStyle bodyTextOp(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).textTheme.bodyLarge?.color,
    );
  }

  static TextStyle bodyText2(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).textTheme.bodyMedium?.color,
    );
  }

  static TextStyle caption(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Theme.of(context).textTheme.bodySmall?.color,
    );
  }

// -------------
  static TextStyle bodyTextMedium(BuildContext context) {
    return const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor,
      wordSpacing: 1,
      letterSpacing: 0.5,
    );
  }

  static TextStyle bodyText(BuildContext context) {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.whiteColor,
      wordSpacing: 1,
      letterSpacing: 0.5,
    );
  }

  static TextStyle bodyText1Op(BuildContext context) {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.whiteOpColor,
      wordSpacing: 1,
      letterSpacing: 0.5,
    );
  }

  static TextStyle bodyText2Op(BuildContext context) {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.whiteOpColor,
      wordSpacing: 1,
      letterSpacing: 0.5,
    );
  }
}
