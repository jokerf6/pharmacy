import 'package:MyCareer/controller/homepage.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/applayButton.widget.dart';
import 'home/person3.widget.dart';

class applayJob extends StatelessWidget {
  const applayJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: GetBuilder<homepageControllerImp>(
            builder: (controller) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          controller.applay["company"]["image"],
                          height: 40,
                          width: 40,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          controller.applay["company"]["name"],
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: app_colors.secondText),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      controller.applay["jobTitle"]["title"],
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: app_colors.secondText),
                    ),
                  ],
                ),
                const person3(title: "Skills", ok: true),
                const person3(title: "Description", ok: false),
                applayButton(
                  ok: true,
                ),
              ],
            ),
          ),
        ),
      )),
    ));
  }
}
