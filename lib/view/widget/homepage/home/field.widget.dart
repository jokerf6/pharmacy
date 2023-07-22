import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';

class field extends StatelessWidget {
  final String text;
  const field({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(text),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: app_colors.field2,
      ),
    );
  }
}
