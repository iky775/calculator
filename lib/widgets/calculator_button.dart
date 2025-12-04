import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isAccented;
  final bool isDanger;

  const CalculatorButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isAccented = false,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor = AppColors.buttonSecondary;
    Color textColor = AppColors.textPrimary;

    if (isAccented) {
      bgColor = AppColors.accent;
      textColor = Colors.black;
    } else if (isDanger) {
      bgColor = AppColors.danger;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
