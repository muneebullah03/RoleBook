import 'package:contact_app/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.buttonColor = AppColors.primaryColor,
      this.textColor = AppColors.witheText,
      this.hight = 60,
      this.width = 80});

  final String title;
  final VoidCallback onTap;
  final Color buttonColor, textColor;
  final double hight, width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: hight,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: buttonColor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
