import 'package:MyCareer/controller/homepage.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class searchField extends StatelessWidget {
  const searchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: app_colors.secondText,
              blurRadius: 10,
              spreadRadius: -8,
              offset: Offset(-5, 5),
            ),
          ],
        ),
        child: GetBuilder<homepageControllerImp>(
          builder: (controller) => TextFormField(
            controller: controller.search,
            onChanged: (value) => controller.changeSearch(),
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              fillColor: app_colors.field,
              prefixIcon: const Padding(
                padding: EdgeInsetsDirectional.only(start: 42.0, end: 10),
                child: Icon(Icons.search), // myIcon is a 48px-wide widget.
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w100),
              filled: true,
              hintText: "Job Title or keyword | Location ",
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: app_colors.field, width: 1),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ),
    );
  }
}
