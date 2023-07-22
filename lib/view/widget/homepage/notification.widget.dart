import 'package:MyCareer/controller/homepage.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:MyCareer/core/function/calcDate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class notifications extends StatelessWidget {
  const notifications({super.key});

  @override
  Widget build(BuildContext context) {
    homepageControllerImp controller = Get.put(homepageControllerImp());
    controller.notificationSize = 0;
    return SafeArea(
        child: controller.allNotificationSize > 0
            ? Container(
                child: ListView.builder(
                itemCount: controller.allNotification.length,
                controller: controller.notificationScroll,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: Card(
                    color: !controller.allNotification[index]["read"]
                        ? Colors.blue[50]
                        : Colors.white,
                    child: ListTile(
                      leading: Image.network(
                        controller.allNotification[index]["company"]["image"],
                        width: 40,
                      ),
                      trailing: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: !controller.allNotification[index]["read"]
                              ? Colors.red
                              : app_colors.secondText,
                        ),
                      ),
                      subtitle: Text(
                          controller.allNotification[index]["description"]),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.allNotification[index]["company"]
                                ["name"],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            calcDate(
                                controller.allNotification[index]["createdAt"]),
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ))
            : Center(child: Text("There isnot Notification for you till now")));
  }
}
