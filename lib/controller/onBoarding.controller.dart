import 'package:MyCareer/core/constatnt/rootes.dart';
import 'package:MyCareer/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class onBoardingController extends GetxController {
  next();
  onPageChanged(int index);
  toLogin();
}

class onBoardingControllerImp extends onBoardingController {
  int currentPage = 0;
  late PageController pageController;

  //  -> to go to next page view
  @override
  next() {
    currentPage++;
    currentPage <= OnBoardingList.length - 1
        ? pageController.animateToPage(currentPage,
            duration: Duration(milliseconds: 900), curve: Curves.easeInOut)
        : Get.offAllNamed(AppRoute.login);
    ;
  }

  // -> to got to login
  @override
  toLogin() {
    Get.offAllNamed(AppRoute.login);
  }

  // -> save current page
  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    // TODO: implement onInit
    super.onInit();
  }
}
