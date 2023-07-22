import 'package:MyCareer/controller/homepage.controller.dart';
import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class drop extends StatelessWidget {
  final String text;
  final List listt;
  final String type;
  final int index;
  const drop(
      {super.key,
      required this.text,
      required this.listt,
      required this.type,
      required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: GetBuilder<homepageControllerImp>(
          builder: (controller) => Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.0)),
            elevation: 5.0,

            clipBehavior: Clip.antiAlias, // Add This
            shadowColor: Color.fromARGB(255, 223, 223, 223),
            child: MaterialButton(
              minWidth: double.infinity,
              onPressed: () => null,
              child: DropdownButtonHideUnderline(
                // Step 3.

                child: ButtonTheme(
                  alignedDropdown: true,
                  child: Expanded(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis),
                      value: text,

                      // Step 4.

                      hint: Text("sssss"),
                      items: listt.map<DropdownMenuItem<String>>((e) {
                        var tex = e;
                        print("ooooooooooooooo");
                        if (type == "job") {
                          tex = e["title"];
                        } else if (type == "company") {
                          tex = e["name"];
                        }
                        return DropdownMenuItem(
                            value: tex,
                            child: Text(
                              tex,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.grey),
                            ));
                      }).toList(),
                      onChanged: (val) {
                        if (index == 0) {
                          controller.changeJobTitle(val!);
                        } else if (index == 1) {
                          controller.changeTypes(val!);
                        } else if (index == 2) {
                          controller.changeJobType(val!);
                        } else if (index == 3) {
                          controller.changeWayOfWork(val!);
                        } else if (index == 4) {
                          controller.changeSalary(val!);
                        } else if (index == 5) {
                          controller.changeCompany(val!);
                        }
                      },
                    ),
                  ),
                ),
              ),
              color: app_colors.field,
            ),
          ),
        ));
  }
}
