import 'package:evently/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon, this.validator, required this.controller, required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: AppColors.black),
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.grey),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: AppColors.grey) : null,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.primary,
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
      validator: validator,
    );
  }
}