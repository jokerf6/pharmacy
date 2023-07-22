import 'package:MyCareer/controller/homepage.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class person3 extends StatelessWidget {
  final String title;
  final bool ok;
  const person3({super.key, required this.title, required this.ok});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.blue.withOpacity(0.5),
          blurRadius: 10,
          spreadRadius: -8,
          offset: const Offset(-1, 5),
        ),
      ]),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GetBuilder<homepageControllerImp>(
        builder: (controller) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            ok
                ? Container(
                    height: MediaQuery.of(context).size.height / 2.8,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: GridView.builder(
                        itemCount: controller.applay["jobSkills"].length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: app_colors.field),
                            child: Center(
                              child: Text(
                                controller.applay["jobSkills"][index]["skill"]
                                    ["skill"],
                                style: TextStyle(color: app_colors.secondText),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height / 5,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical, //.horizontal

                      child: Text(controller.applay["jobDescription"]),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
