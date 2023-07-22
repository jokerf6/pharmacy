import 'package:MyCareer/controller/onBoarding.controller.dart';
import 'package:MyCareer/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class normalText extends StatelessWidget {
  const normalText({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onBoardingControllerImp>(
      builder: (controller) => Text(
        OnBoardingList[controller.currentPage].title.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
            height: 1.5,
            fontSize: 28,
            color: Colors.black,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
