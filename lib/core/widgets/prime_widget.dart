import 'package:evently/core/utils/app_colors.dart';

import 'package:flutter/material.dart';


class PrimeWidget extends StatelessWidget {
  final bool isEnglish;
  final String text;
  final TextStyle? style;
  final Color color ;
  const PrimeWidget({super.key, required this.isEnglish, required this.text, required this.style, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 5),
    decoration: BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(8)
    ),
    child: Text(text,style: style),
    );
  }
}
