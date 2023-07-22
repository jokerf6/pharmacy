import 'package:MyCareer/controller/onBoarding.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class skipText extends GetView<onBoardingControllerImp> {
  const skipText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: InkWell(
          onTap: () => controller.toLogin(),
          child: Text(
            "Skip",
            style: TextStyle(
                color: app_colors.secondText,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
