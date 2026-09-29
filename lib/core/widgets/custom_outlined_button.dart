import 'package:evently/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color? borderColor;
  final Color? backgroundColor;
  final double borderRadius;
  final double height;
  final double? width;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderColor = AppColors.primary,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = 16.0,
    this.height = 56.0,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide(
            color: borderColor ?? AppColors.primary,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: child,
      ),
    );
  }
}