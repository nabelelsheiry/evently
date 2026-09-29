import 'package:evently/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String text;
  final Widget widget;
  final Color color;
  final Color textColor;
  const ProfileWidget({super.key, required this.text, required this.widget, required this.color, required this.textColor});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: 48,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        children: [
          Text(text ,style: theme.textTheme.titleSmall?.copyWith( fontWeight: FontWeight.w500,color:textColor ),),
          Spacer(),
          widget
        ],
      )
    );
  }
}
