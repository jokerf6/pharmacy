import 'dart:math';

import 'package:MyCareer/core/class/crud.class.dart';
import 'package:MyCareer/core/constatnt/links.dart';
import 'package:MyCareer/data/model/sharedPrefrence.dart';

class homeRemote {
  crud Crud;
  homeRemote(this.Crud);
  String token = "";
  getUserData() async {
    await preference().getUserData().then((value) {
      List list = value;
      token = list[0].accessToken.toString();
    });
  }

  saved() async {
    await getUserData();
    print("|89898898889898989");
    var response = await Crud.getTokenData(links.savedJobs, token);
    print(response);
    return response.fold((l) => l, (r) => r);
  }

  featureJobs(take) async {
    print("vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");

    await getUserData();
    print("|89898898889898989");

    var response =
        await Crud.getTokenData("${links.featureJobs}&skip=$take", token);
    print(response);
    return response.fold((l) => l, (r) => r);
  }

  search(String searchVal) async {
    await getUserData();

    var response = await Crud.postTokenData(links.search, token, {
      "searchData": searchVal,
    });

    return response.fold((l) => l, (r) => r);
  }

  recommendedJobs(take) async {
    await getUserData();
    var response = await Crud.getTokenData(links.recommendedJobs, token);

    return response.fold((l) => l, (r) => r);
  }

  bookMark(String id) async {
    await getUserData();
    var response =
        await Crud.getTokenData("${links.bookmark}/$id/bookmark", token);
    return response.fold((l) => l, (r) => r);
  }

  getJobs() async {
    var response = await Crud.getData(links.jobs);
    return response.fold((l) => l, (r) => r);
  }

  logout() async {
    await getUserData();

    var response = await Crud.getTokenData(links.logout, token);
    return response.fold((l) => l, (r) => r);
  }

  getCompany() async {
    var response = await Crud.getData(links.company);
    return response.fold((l) => l, (r) => r);
  }

  save(String link) async {
    await getUserData();
    var response = await Crud.getTokenData(link, token);
    return response.fold((l) => l, (r) => r);
  }

  notificationNumber() async {
    await getUserData();
    var response = await Crud.getTokenData(links.notificationNumber, token);
    return response.fold((l) => l, (r) => r);
  }

  getNotification(size, sizeNow) async {
    await getUserData();
    int theReminder = size - sizeNow;
    var response = await Crud.getTokenData(
        "${links.notification}?take=${min(theReminder, 10)}&skip=${sizeNow}",
        token);
    return response.fold((l) => l, (r) => r);
  }
}
