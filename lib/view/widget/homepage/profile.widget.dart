import 'package:MyCareer/controller/homepage.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/core/function/calcDate.dart';
import 'package:MyCareer/view/widget/homepage/profile/tabs.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ConstrainedBox(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
      child: SafeArea(
          child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: GetBuilder<homepageControllerImp>(
          builder: (controller) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              controller.userData.image.toString()),
                          fit: BoxFit.fill),
                    ),
                  ),
                  //

                  const SizedBox(
                    width: 80,
                  ),
                  Container(
                    width: 1,
                    color: Colors.grey[400],
                    height: 100,
                  ),
                  const SizedBox(
                    width: 20,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Joined",
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        calcDate(controller.userData.createdAt.toString())
                            .toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.userData.name
                                      .toString()
                                      .split(" ")
                                      .length >
                                  0
                              ? controller.userData.name
                                  .toString()
                                  .split(" ")[0]
                              : controller.userData.name.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: controller.userData.name
                                        .toString()
                                        .split(" ")[0]
                                        .length >
                                    8
                                ? 25
                                : 35,
                            height: 0.10,
                          ),
                        ),
                        Text(
                          controller.userData.name.toString().contains(" ")
                              ? controller.userData.name
                                  .toString()
                                  .split(" ")[1]
                              : "",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: controller.userData.name
                                          .toString()
                                          .split(" ")[0]
                                          .length >
                                      8
                                  ? 25
                                  : 35,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(right: 30, top: 20),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: app_colors.secondText,
                              blurRadius: 10,
                              spreadRadius: -8,
                              offset: Offset(-5, 5),
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${controller.userData.view} \nViews",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          )
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Column(
                children: [
                  tabs(
                    space: 78,
                    Name: "My Profile",
                    color1: app_colors.primaryColor,
                    color2: app_colors.primaryColor.withOpacity(0.1),
                    icon: const Icon(
                      Icons.person,
                      color: app_colors.primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  tabs(
                    space: 68,
                    Name: "Saved Jobs",
                    color1: Colors.blue,
                    color2:
                        const Color.fromRGBO(33, 150, 243, 1).withOpacity(0.1),
                    icon: const Icon(
                      Icons.bookmark,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 30),
                child: Container(
                  width: 180,
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    elevation: 1.0,
                    clipBehavior: Clip.antiAlias, // Add This
                    // shadowColor: app_colors.secondText,
                    child: MaterialButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 18),
                      onPressed: () {
                        controller.logout();
                        // controller.next();
                      },
                      color: app_colors.field2,
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.logout_outlined,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Sign Out",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: app_colors.secondText),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    ));
  }
}
