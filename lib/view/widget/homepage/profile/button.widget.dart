import 'package:MyCareer/core/constatnt/colors.dart';
import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final String name;
  final Icon icon;
  final double Width;
  final Color color;
  const button({
    super.key,
    required this.color,
    required this.Width,
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Width,
      margin: const EdgeInsets.only(bottom: 30),
      child: Material(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
        elevation: 1.0,
        clipBehavior: Clip.antiAlias, // Add This
        // shadowColor: app_colors.secondText,
        child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          onPressed: () {
            // controller.next();
          },
          color: color,
          textColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              icon,
              const SizedBox(
                width: 15,
              ),
              Text(
                name,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: app_colors.secondText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
