import 'package:MyCareer/core/class/crud.class.dart';
import 'package:MyCareer/core/constatnt/links.dart';
import 'package:MyCareer/data/model/sharedPrefrence.dart';

class dashboardRemote {
  crud Crud;
  dashboardRemote(this.Crud);
  String token = "";
  getUserData() async {
    await preference().getUserData().then((value) {
      List list = value;
      token = list[0].accessToken.toString();
    });
  }

  editData(String name, String github, String behance, String about,
      String cityId, String jobId, String cv) async {
    await getUserData();

    var response = await Crud.editTokenData(links.editUser, token, {
      "name": name,
      "github": github,
      "behance": behance,
      "about": about,
      "cityId": cityId,
      "jobId": jobId,
      "cv": cv,
    });
    return response.fold((l) => l, (r) => r);
  }

  editImage(String img) async {
    await getUserData();

    var response = await Crud.editTokenData(links.editImage, token, {
      "image": img,
    });
    return response.fold((l) => l, (r) => r);
  }
}
