import 'package:MyCareer/controller/homepage.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/view/widget/homepage/home/field.widget.dart';
import 'package:MyCareer/view/widget/homepage/home/user.widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FeatureCard3 extends StatelessWidget {
  const FeatureCard3({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homepageControllerImp>(
      builder: (controller) => controller.all.isEmpty
          ? const Center(child: Text("There isnot any job Matching You"))
          : ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              controller: controller.scroll,
              scrollDirection: Axis.vertical,
              itemCount: controller.all.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () => controller.goToApplay(controller.all[index]),
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
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      user(
                        Flex: 1,
                        erase: false,
                        top: true,
                        icon: IconButton(
                          onPressed: () {
                            if (controller.all[index]["userJobs"].length > 0) {
                              return controller.bookmark(
                                  controller.all[index]["id"], false, index);
                            } else {
                              return controller.bookmark(
                                  controller.all[index]["id"], false, index);
                            }
                          },
                          icon: Icon(
                            controller.all[index]["userJobs"].length > 0
                                ? Icons.bookmark
                                : Icons.bookmark_outline,
                            color: app_colors.primaryColor,
                          ),
                        ),
                        image: controller.all[index]["company"]["image"],
                        space: 10,
                        title: controller.all[index]["jobTitle"]["title"],
                        subtitle: controller.all[index]["company"]["name"],
                      ),
                      Row(
                        children: [
                          field(text: controller.all[index]["jobLocationType"]),
                          const Spacer(
                            flex: 1,
                          ),
                          field(text: controller.all[index]["jobType"]),
                          const Spacer(
                            flex: 2,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              "\$${controller.all[index]["salary"]} / ${controller.all[index]["salaryPer"]} "),
                          const Spacer(
                            flex: 1,
                          ),
                          Text("${controller.all[index]["location"]["name"]}"),
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
