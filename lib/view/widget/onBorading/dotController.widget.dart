import 'package:MyCareer/controller/onBoarding.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class dotController_onBoarding extends StatelessWidget {
  const dotController_onBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onBoardingControllerImp>(
        builder: (controller) =>
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ...List.generate(
                  OnBoardingList.length,
                  (index) => AnimatedContainer(
                        margin: EdgeInsets.only(right: 5),
                        duration: const Duration(microseconds: 90000),
                        curve: Curves.easeInOut,
                        width: controller.currentPage == index ? 20 : 5,
                        height: 6,
                        decoration: BoxDecoration(
                          color: app_colors.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ))
            ]));
  }
}
