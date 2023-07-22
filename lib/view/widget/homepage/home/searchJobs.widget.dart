import 'package:MyCareer/controller/homepage.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/view/widget/homepage/home/field.widget.dart';
import 'package:MyCareer/view/widget/homepage/home/user.widget.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class searchJobs extends StatelessWidget {
  const searchJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homepageControllerImp>(
      builder: (controller) => controller.SearchList.isEmpty
          ? const Center(child: Text("There isnot any job Matching You"))
          : SizedBox(
              height: MediaQuery.of(context).size.height - 330,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: controller.SearchList.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () =>
                        controller.goToApplay(controller.SearchList[index]),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
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
                                        .SearchList[index]["userJobs"].length >
                                    0) {
                                  return controller.bookmark(
                                      controller.SearchList[index]["id"],
                                      false,
                                      index);
                                } else {
                                  return controller.bookmark(
                                      controller.SearchList[index]["id"],
                                      false,
                                      index);
                                }
                              },
                              icon: Icon(
                                controller.SearchList[index]["userJobs"]
                                            .length >
                                        0
                                    ? Icons.bookmark
                                    : Icons.bookmark_outline,
                                color: app_colors.primaryColor,
                              ),
                            ),
                            image: controller.SearchList[index]["company"]
                                ["image"],
                            space: 10,
                            title: controller.SearchList[index]["jobTitle"]
                                ["title"],
                            subtitle: controller.SearchList[index]["company"]
                                ["name"],
                          ),
                          Row(
                            children: [
                              field(
                                  text: controller.SearchList[index]
                                      ["jobLocationType"]),
                              const Spacer(
                                flex: 1,
                              ),
                              field(
                                  text: controller.SearchList[index]
                                      ["jobType"]),
                              const Spacer(
                                flex: 2,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  "\$${controller.SearchList[index]["salary"]} / ${controller.SearchList[index]["salaryPer"]} "),
                              const Spacer(
                                flex: 1,
                              ),
                              Text(
                                  "${controller.SearchList[index]["location"]["name"]}"),
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
              ),
            ),
    );
  }
}
