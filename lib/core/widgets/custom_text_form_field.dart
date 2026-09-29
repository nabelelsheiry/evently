import 'package:evently/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool isDark;
  final Color primaryColor;
  final Color inputTextColor;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    required this.isDark,
    required this.primaryColor,
    required this.inputTextColor,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(color: inputTextColor),
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: isDark ? Colors.transparent : AppColors.white,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.grey),
        prefixIcon: Icon(prefixIcon, color: AppColors.grey),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: isDark
              ? const BorderSide(
            color: AppColors.primary,
            width: 1.5,
          )
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.red,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.red,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}