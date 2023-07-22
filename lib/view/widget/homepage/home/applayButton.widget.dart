import 'package:MyCareer/controller/homepage.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class applayButton extends StatelessWidget {
  final bool ok;
  const applayButton({super.key, required this.ok});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Material(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
        elevation: 5.0,
        clipBehavior: Clip.antiAlias, // Add This
        shadowColor: app_colors.secondText,
        child: GetBuilder<homepageControllerImp>(
          builder: (controller) => MaterialButton(
            minWidth: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
            onPressed: () {},
            color: controller.alreadyApplayed
                ? app_colors.secondText
                : app_colors.primaryColor,
            textColor: Colors.white,
            child: Container(
              child: Text(
                controller.alreadyApplayed ? "Already Applayed" : "Applay",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
