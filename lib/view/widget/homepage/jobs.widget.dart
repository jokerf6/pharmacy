import 'package:MyCareer/controller/homepage.controller.dart';
import 'package:MyCareer/view/widget/homepage/home/FeatureCard3.widget.dart';
import 'package:MyCareer/view/widget/homepage/home/save.widget.dart';
import 'package:MyCareer/view/widget/homepage/home/drop.widget.dart';
import 'package:MyCareer/view/widget/homepage/home/user.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class jobs extends StatelessWidget {
  const jobs({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey(); // Create a key

    return Scaffold(
      key: key,
      drawerEnableOpenDragGesture: false,
      endDrawer: Drawer(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            width: double.infinity,
            child: GetBuilder<homepageControllerImp>(
              builder: (controller) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      drop(
                        text: controller.jobTitleValue,
                        listt: controller.jobTitles,
                        type: "job",
                        index: 0,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      drop(
                        text: controller.typesValue,
                        listt: controller.types,
                        type: "other",
                        index: 1,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      drop(
                        text: controller.jobTypesValue,
                        listt: controller.jobTypes,
                        type: "other",
                        index: 2,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      drop(
                        text: controller.wayOfWorkValue,
                        listt: controller.wayOfWork,
                        type: "other",
                        index: 3,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      drop(
                        text: controller.salaryValue,
                        listt: controller.salary,
                        type: "other",
                        index: 4,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      drop(
                        text: controller.companyValue,
                        listt: controller.company,
                        type: "company",
                        index: 5,
                      ),
                    ],
                  ),
                  Column(
                    children: const [
                      save(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: GetBuilder<homepageControllerImp>(
        builder: (controller) => SafeArea(
            child: Container(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                child: user(
                  erase: false,
                  Flex: 1,
                  top: false,
                  icon: IconButton(
                      onPressed: () {
                        key.currentState!.openEndDrawer();
                      },
                      icon: const Icon(Icons.filter_list_rounded)),
                  space: 5,
                  title: controller.userData.name.toString(),
                  subtitle: controller.userData.subTitle.toString(),
                  image: controller.userData.image.toString(),
                ),
              ),
              const Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: FeatureCard3(),
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
