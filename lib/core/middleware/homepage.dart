import 'package:MyCareer/core/constatnt/rootes.dart';
import 'package:MyCareer/core/services/myServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getBool("login") != null) {
      return const RouteSettings(name: AppRoute.homepage);
    }
    return null;
  }
}
