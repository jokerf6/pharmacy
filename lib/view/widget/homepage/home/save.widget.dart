import 'package:MyCareer/controller/homepage.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class save extends StatelessWidget {
  const save({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
      elevation: 5.0,
      clipBehavior: Clip.antiAlias, // Add This
      shadowColor: app_colors.secondText,
      child: GetBuilder<homepageControllerImp>(
        builder: (controller) => MaterialButton(
          minWidth: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
          onPressed: () {
            controller.save();
          },
          color: app_colors.primaryColor,
          textColor: Colors.white,
          child: Text(
            "Save",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
