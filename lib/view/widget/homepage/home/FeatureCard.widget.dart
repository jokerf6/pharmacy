import 'package:MyCareer/controller/homepage.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/view/widget/homepage/home/field.widget.dart';
import 'package:MyCareer/view/widget/homepage/home/user.widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FeatureCard extends StatelessWidget {
  final bool all;
  const FeatureCard({super.key, required this.all});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homepageControllerImp>(
      builder: (controller) => ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
          height: 10,
        ),
        scrollDirection: all ? Axis.vertical : Axis.horizontal,
        itemCount: controller.Feature.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => controller.goToApplay(controller.Feature[index]),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: app_colors.field,
                boxShadow: [
                  BoxShadow(
                    color: app_colors.secondText,
                    blurRadius: 10,
                    spreadRadius: -8,
                    offset: Offset(-5, 5),
                  ),
                ]),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            height: 200,
            width: (MediaQuery.of(context).size.width / 4) * 3.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                user(
                  Flex: 1,
                  top: true,
                  erase: false,
                  icon: IconButton(
                      onPressed: () {
                        if (controller.Feature[index]["userJobs"].length > 0) {
                          return controller.bookmark(
                              controller.Feature[index]["id"], true, index);
                        } else {
                          return controller.bookmark(
                              controller.Feature[index]["id"], true, index);
                        }
                      },
                      icon: Icon(
                        controller.Feature[index]["userJobs"].length > 0
                            ? Icons.bookmark
                            : Icons.bookmark_outline,
                        color: app_colors.primaryColor,
                      )),
                  image: controller.Feature[index]["company"]["image"],
                  space: 5,
                  title: controller.Feature[index]["jobTitle"]["title"],
                  subtitle: controller.Feature[index]["company"]["name"],
                ),
                Row(
                  children: [
                    field(text: controller.Feature[index]["jobLocationType"]),
                    const Spacer(
                      flex: 1,
                    ),
                    field(text: controller.Feature[index]["jobType"]),
                    const Spacer(
                      flex: 1,
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                        "\$${controller.Feature[index]["salary"]} / ${controller.Feature[index]["salaryPer"]} "),
                    const Spacer(
                      flex: 1,
                    ),
                    Text("${controller.Feature[index]["location"]["name"]}"),
                    const Spacer(
                      flex: 1,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
