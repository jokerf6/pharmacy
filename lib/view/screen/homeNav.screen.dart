import 'package:MyCareer/core/class/handllingdataview.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/view/widget/homepage/home.widget.dart';
import 'package:MyCareer/view/widget/homepage/jobs.widget.dart';
import 'package:MyCareer/view/widget/homepage/notification.widget.dart';
import 'package:MyCareer/view/widget/homepage/profile.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homepage.controller.dart';

class homepage extends StatelessWidget {
  List<Widget> widgets = [
    home(),
    notifications(),
    jobs(),
    profile(),
  ];

  homepage({super.key});

  @override
  Widget build(BuildContext context) {
    homepageControllerImp controller = Get.put(homepageControllerImp());
    return GetBuilder<homepageControllerImp>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Stack(children: [
                Icon(Icons.notifications_none),
                controller.notificationSize != 0
                    ? Positioned(
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 12,
                            minHeight: 12,
                          ),
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : Text(""),
              ]),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_outline_rounded),
              label: 'Jobs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
          currentIndex: controller.currentPage,
          unselectedItemColor: app_colors.secondText,
          selectedItemColor: app_colors.primaryColor,
          onTap: (value) => controller.changePage(value),
          iconSize: 30,
        ),
        body: GetBuilder<homepageControllerImp>(
          builder: (controller) {
            if (controller.currentPage == 0) {
              return handlingView(
                  StatusRequest: controller.homeStatusRequest,
                  widget: widgets[controller.currentPage]);
            } else {
              return widgets[controller.currentPage];
            }
          },
        ),
      ),
    );
  }
}
