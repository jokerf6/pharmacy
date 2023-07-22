import 'package:MyCareer/core/class/crud.class.dart';
import 'package:get/get.dart';

class loginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(crud());
  }
}
