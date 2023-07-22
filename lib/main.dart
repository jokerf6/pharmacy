import 'package:MyCareer/binding/login.binding.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/core/services/myServices.dart';
import 'package:MyCareer/roots.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(25, 49, 133, 1),
      100: Color.fromRGBO(25, 49, 133, 0.9),
      200: Color.fromRGBO(25, 49, 133, 0.8),
      300: Color.fromRGBO(25, 49, 133, 0.7),
      400: Color.fromRGBO(25, 49, 133, 0.6),
      500: Color.fromRGBO(25, 49, 133, 0.5),
      600: Color.fromRGBO(25, 49, 133, 0.4),
      700: Color.fromRGBO(25, 49, 133, 0.3),
      800: Color.fromRGBO(25, 49, 133, 0.2),
      900: Color.fromRGBO(25, 49, 133, 0.1),
    };
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: MaterialColor(0xff193185, color),
          fontFamily: "Cairo",
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
                TextStyle(color: Colors.red, overflow: TextOverflow.ellipsis)),
          )),
          textTheme: TextTheme(
            displayLarge: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 21),
            titleLarge: TextStyle(color: app_colors.secondText, fontSize: 16),
          )),
      getPages: routes,
      initialBinding: loginBinding(),
    );
  }
}
