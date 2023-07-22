import 'package:MyCareer/controller/homepage.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class tabs extends StatelessWidget {
  final String Name;
  final Color color1;
  final Color color2;
  final Icon icon;
  final double space;
  const tabs(
      {super.key,
      required this.space,
      required this.Name,
      required this.color1,
      required this.color2,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homepageControllerImp>(
      builder: (controller) => InkWell(
        onTap: () {
          if (Name == "My Profile") {
            controller.toDashboard();
          } else {
            controller.toSaved();
          }
        },
        child: Container(
          margin: const EdgeInsets.only(left: 24),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), color: color2),
                child: icon,
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                Name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 18),
              ),
              SizedBox(
                width: space,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: app_colors.field2),
                child: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
