import 'package:MyCareer/core/class/statusRequesr.class.dart';
import 'package:MyCareer/core/constatnt/images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class handlingView extends StatelessWidget {
  final statusRequest StatusRequest;
  final Widget widget;

  const handlingView(
      {super.key, required this.StatusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return StatusRequest == statusRequest.loading
        ? Center(
            child: Lottie.asset(images.loading2, repeat: true),
          )
        : StatusRequest == statusRequest.offline
            ? Center(
                child: Lottie.asset(images.offline, repeat: true),
              )
            : StatusRequest == statusRequest.success ||
                    StatusRequest == statusRequest.static
                ? widget
                : Center(
                    child: Lottie.asset(images.serverError, repeat: true),
                  );
  }
}
