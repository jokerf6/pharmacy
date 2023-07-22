import 'package:MyCareer/controller/onBoarding.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class body extends StatelessWidget {
  const body({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onBoardingControllerImp>(
      builder: (controller) => Text(
        OnBoardingList[controller.currentPage].body.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
            height: 1.5,
            fontSize: 18,
            color: app_colors.secondText,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
