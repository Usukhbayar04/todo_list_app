import 'package:flutter/material.dart';
import '../utils/colors.dart';

// FILTER BUTTONS WIDGET
class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor;
    switch (text) {
      case 'Pending':
        textColor = AppColors.errorColor;
        break;
      case 'Completed':
        textColor = const Color.fromARGB(228, 18, 158, 93);
        break;
      default:
        textColor = AppColors.blueColor;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected
              ? AppColors.buttonColorDarkMode
              : AppColors.backgroundColorDarkMode,
          border: Border.all(
            color: isSelected
                ? AppColors.brandOpColor
                : AppColors.backgroundColorDarkMode,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
