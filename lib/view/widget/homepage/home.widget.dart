import 'package:MyCareer/controller/homepage.controller.dart';
import 'package:MyCareer/core/class/handlingdataview2.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/view/widget/homepage/home/Feature.widget.dart';
import 'package:MyCareer/view/widget/homepage/home/FeatureCard.widget.dart';
import 'package:MyCareer/view/widget/homepage/home/FeatureCard2.widget.dart';
import 'package:MyCareer/view/widget/homepage/home/searchField.widget.dart';
import 'package:MyCareer/view/widget/homepage/home/searchJobs.widget.dart';
import 'package:MyCareer/view/widget/homepage/home/user.widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: SafeArea(
                child: GetBuilder<homepageControllerImp>(
              builder: (controller) => Container(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      child: user(
                        Flex: 1,
                        top: false,
                        icon: IconButton(
                          onPressed: () => null,
                          icon: const Icon(
                            Icons.message,
                            color: app_colors.secondText,
                          ),
                        ),
                        erase: true,
                        space: 5,
                        title: controller.userData.name.toString(),
                        subtitle: controller.userData.subTitle.toString(),
                        image: controller.userData.image.toString(),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: const searchField()),
                    const SizedBox(
                      height: 20,
                    ),
                    controller.change
                        ? handlingView2(
                            StatusRequest: controller.searchStatusRequest,
                            widget: const searchJobs())
                        : SizedBox(
                            height: MediaQuery.of(context).size.height - 260,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: const Feature(
                                    text: "Feature Jobs",
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 25),
                                    child: FeatureCard(all: false),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: const Feature(
                                    text: "Recommended Jobs",
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Expanded(
                                    flex: 7,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 25),
                                      child: FeatureCard2(),
                                    )),
                              ],
                            ),
                          )
                  ],
                ),
              ),
            ))));
  }
}
