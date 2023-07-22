import 'package:MyCareer/controller/onBoarding.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  //const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(onBoardingControllerImp());

    return Scaffold(body: Container());
  }
}
/*

      */