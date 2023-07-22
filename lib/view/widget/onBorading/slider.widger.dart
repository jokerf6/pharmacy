import 'package:MyCareer/controller/onBoarding.controller.dart';
import 'package:MyCareer/data/datasource/static/static.dart';
import 'package:MyCareer/view/widget/onBorading/body.widget.dart';
import 'package:MyCareer/view/widget/onBorading/custtomText.dart';
import 'package:MyCareer/view/widget/onBorading/normalText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class slider_onBoarding extends GetView<onBoardingControllerImp> {
  const slider_onBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) => {
        controller.onPageChanged(val),
      },
      physics: BouncingScrollPhysics(),
      itemCount: OnBoardingList.length,
      itemBuilder: (context, index) => Column(children: [
        Image.asset(
          OnBoardingList[index].image!,
          height: 250,
          fit: BoxFit.fill,
        ),
        SizedBox(height: index == OnBoardingList.length - 1 ? 100 : 50),
        index == 0 ? custtomText() : normalText(),
        SizedBox(
          height: 40,
        ),
        if (index != OnBoardingList.length) body(),
      ]),
    );
  }
}
