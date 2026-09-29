import 'package:evently/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeWidget extends StatelessWidget {
  final bool isLight;
  final Widget widget;
  final Color color;
  const ThemeWidget({super.key, required this.isLight, required this.widget, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 5),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8)
      ),
      child: widget,
    );
  }
}
