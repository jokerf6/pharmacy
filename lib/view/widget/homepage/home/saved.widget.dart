import 'package:MyCareer/controller/homepage.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/core/constatnt/rootes.dart';
import 'package:MyCareer/view/widget/homepage/home/field.widget.dart';
import 'package:MyCareer/view/widget/homepage/home/user.widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class savedJobs extends StatelessWidget {
  const savedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: app_colors.primaryColor,
        shadowColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () => Get.offNamed(AppRoute.homepage),
        ),
        title: const Center(
          child: Text(
            "Saved Jobs",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      body: GetBuilder<homepageControllerImp>(
        builder: (controller) => controller.Saved.isEmpty
            ? const Center(child: Text("There isnot any job Matching You"))
            : Container(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: controller.Saved.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => controller.goToApplay(controller.Saved[index]),
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
                      height: 170,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          user(
                            erase: false,
                            Flex: 1,
                            top: true,
                            icon: IconButton(
                              onPressed: () {
                                controller.ersaeJop(index,
                                    controller.Saved[index]["jobs"]["id"]);
                              },
                              icon: const Icon(
                                Icons.bookmark,
                                color: app_colors.primaryColor,
                              ),
                            ),
                            image: controller.Saved[index]["company"]["image"],
                            space: 10,
                            title: controller.Saved[index]["jobs"]["jobTitle"]
                                ["title"],
                            subtitle: controller.Saved[index]["jobs"]["company"]
                                ["name"],
                          ),
                          Row(
                            children: [
                              field(
                                  text: controller.Saved[index]["jobs"]
                                      ["jobLocationType"]),
                              const Spacer(
                                flex: 1,
                              ),
                              field(
                                  text: controller.Saved[index]["jobs"]
                                      ["jobType"]),
                              const Spacer(
                                flex: 2,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  "\$${controller.Saved[index]["jobs"]["salary"]} / ${controller.Saved[index]["jobs"]["salaryPer"]} "),
                              const Spacer(
                                flex: 1,
                              ),
                              Text(
                                  "${controller.Saved[index]["jobs"]["location"]["name"]}"),
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
