import 'package:MyCareer/core/constatnt/rootes.dart';
import 'package:MyCareer/core/middleware/homepage.dart';
import 'package:MyCareer/view/screen/homeNav.screen.dart';
import 'package:MyCareer/view/screen/homepage.screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => Homepage(), middlewares: [
    MyMiddleWare(),
  ]),
  GetPage(name: AppRoute.homepage, page: () => homepage()),
];
