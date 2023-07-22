import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/data/datasource/static/static.dart';
import 'package:flutter/material.dart';

class custtomText extends StatelessWidget {
  const custtomText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: OnBoardingList[0].title.toString(),
            style: TextStyle(
                height: 1.5,
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: "job",
            style: TextStyle(
                height: 1.5,
                fontSize: 28,
                color: app_colors.primaryColor,
                fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: " !",
            style: TextStyle(
                height: 1.5,
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ]));
  }
}
