import 'package:MyCareer/controller/homepage.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/view/widget/homepage/home/field.widget.dart';
import 'package:MyCareer/view/widget/homepage/home/user.widget.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FeatureCard2 extends StatelessWidget {
  const FeatureCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homepageControllerImp>(
      builder: (controller) => controller.Recommended.isEmpty
          ? const Center(child: Text("There isnot any job Matching You"))
          : ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              scrollDirection: Axis.vertical,
              itemCount: controller.Recommended.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () =>
                    controller.goToApplay(controller.Recommended[index]),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      user(
                        Flex: 1,
                        top: true,
                        erase: false,
                        icon: IconButton(
                          onPressed: () {
                            if (controller
                                    .Recommended[index]["userJobs"].length >
                                0) {
                              return controller.bookmark(
                                  controller.Recommended[index]["id"],
                                  false,
                                  index);
                            } else {
                              return controller.bookmark(
                                  controller.Recommended[index]["id"],
                                  false,
                                  index);
                            }
                          },
                          icon: Icon(
                            controller.Recommended[index]["userJobs"].length > 0
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                            color: app_colors.primaryColor,
                          ),
                        ),
                        image: controller.Recommended[index]["company"]
                            ["image"],
                        space: 10,
                        title: controller.Recommended[index]["jobTitle"]
                            ["title"],
                        subtitle: controller.Recommended[index]["company"]
                            ["name"],
                      ),
                      Row(
                        children: [
                          field(
                              text: controller.Recommended[index]
                                  ["jobLocationType"]),
                          const Spacer(
                            flex: 1,
                          ),
                          field(text: controller.Recommended[index]["jobType"]),
                          const Spacer(
                            flex: 2,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              "\$${controller.Recommended[index]["salary"]} / ${controller.Recommended[index]["salaryPer"]} "),
                          const Spacer(
                            flex: 1,
                          ),
                          Text(
                              "${controller.Recommended[index]["location"]["name"]}"),
                          const Spacer(
                            flex: 2,
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
