import 'package:MyCareer/controller/onBoarding.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customButton_onBoarding extends StatelessWidget {
  const customButton_onBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onBoardingControllerImp>(
        builder: (controller) => Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                elevation: 5.0,
                clipBehavior: Clip.antiAlias, // Add This
                shadowColor: app_colors.secondText,
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 90, vertical: 18),
                  onPressed: () {
                    controller.next();
                  },
                  child: Text(
                    OnBoardingList[controller.currentPage].button.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  color: app_colors.primaryColor,
                  textColor: Colors.white,
                ),
              ),
            ));
  }
}
