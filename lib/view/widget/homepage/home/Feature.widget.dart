import 'package:MyCareer/controller/homepage.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Feature extends StatelessWidget {
  final String text;
  const Feature({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            GetBuilder<homepageControllerImp>(
              builder: (controller) => InkWell(
                onTap: () => text == "Feature Jobs"
                    ? controller.viewAll(true)
                    : controller.viewAll(false),
                child: const Text(
                  "view all",
                  style: TextStyle(
                      color: Color(0xff4E2DAB),
                      fontSize: 15,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
