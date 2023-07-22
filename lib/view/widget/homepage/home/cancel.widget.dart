import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';

class cancel extends StatelessWidget {
  const cancel({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
      elevation: 5.0,
      clipBehavior: Clip.antiAlias, // Add This

      child: MaterialButton(
        minWidth: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 18),
        onPressed: () {},
        child: Text(
          "Cancel",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        color: Colors.white,
        textColor: app_colors.primaryColor,
      ),
    );
  }
}
