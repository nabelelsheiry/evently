import 'package:flutter/material.dart';

class TabbarWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const TabbarWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 84,
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16)
      ),
      child: Center(
        child: Row(
          children: [
            Icon(icon,color: Colors.white,),
            const SizedBox(width: 8,),
            Text(title,style: const TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
