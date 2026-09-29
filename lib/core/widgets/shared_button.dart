import 'package:evently/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SharedButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final TextStyle? style;
  final Color color;

  const SharedButton({super.key, this.onTap, required this.text, this.style, required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color
        ),
        child: Center(child: Text(text,style: style,)),
      ),
    );
  }
}
