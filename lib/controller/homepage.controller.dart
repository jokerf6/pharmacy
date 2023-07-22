import 'package:MyCareer/core/class/statusRequesr.class.dart';
import 'package:MyCareer/core/constatnt/links.dart';
import 'package:MyCareer/core/constatnt/rootes.dart';
import 'package:MyCareer/core/function/handelingResponse.dart';
import 'package:MyCareer/data/model/sharedPrefrence.dart';
import 'package:MyCareer/data/model/user.model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/datasource/remote/home.remote.dart';

abstract class homepageController extends GetxController {
  toDashboard();
  //loginPost loginpost = loginPost(Get.find());
  changePage(int index);
  getUserData();
  FeatureJobs();
  RecommendedJobs();
  bookmark(String id, bool type, int index);
  viewAll(to);

  getJobTitle();
  changeJobTitle(String val);

  getcompany();
  changeCompany(String val);
  changeSalary(String val);
  changeWayOfWork(String val);
  changeJobType(String val);
  changeTypes(String val);
  goToApplay(data);
  save();

  getNotificationNumber();
  getNotification();
}

class homepageControllerImp extends homepageController {
  int currentPage = 0;
  int featureSize = 0;
  int notificationSize = 0;
  int allNotificationSize = 0;
  var allNotification = [];
  late statusRequest homeStatusRequest = statusRequest.static;
  var Feature = [];
  var Recommended = [];
  var Saved = [];
  var all = [];
  var SearchList = [];
  var applay = {};
  bool alreadyApplayed = false;
  homeRemote HomeRemote = homeRemote(Get.find());
  userInfo userData = userInfo();
  bool first = false;
  bool change = false;
  bool notificationEnter = false;
  late TextEditingController search;

  late statusRequest jobStatusRequest = statusRequest.static;
  late statusRequest scrollStatusRequest = statusRequest.static;
  late statusRequest searchStatusRequest = statusRequest.static;

  late statusRequest companyStatusRequest = statusRequest.static;
  late statusRequest saveStatusRequest = statusRequest.static;
  ScrollController scroll = ScrollController();
  ScrollController notificationScroll = ScrollController();

  List jobTitles = [
    {"id": "0", "title": "Job Title"}
  ];
  String jobTitleValue = "Job Title";

  List<String> types = ["FeaturedJobs", "RecommendedJobs", "Saved"];
  String typesValue = "FeaturedJobs";

  List<String> jobTypes = ["Job Type", "Part_Time", "Full_Time", "Internship"];
  String jobTypesValue = "Job Type";

  List<String> wayOfWork = ["the way of work", "On_Site", "Hybrid", "Remote"];
  String wayOfWorkValue = "the way of work";

  List<String> salary = [
    "salary",
    "less than 3000",
    "less than 6000",
    "less than 9000",
  ];
  String salaryValue = "salary";

  List company = [
    {
      "id": "0",
      "name": "company",
    }
  ];
  String companyValue = "company";
  String companyValueId = "";

  @override
  toDashboard() {
    Get.offNamed(AppRoute.dashboard);
    update();
  }

  @override
  getNotificationNumber() async {
    var response = await HomeRemote.notificationNumber();
    notificationSize = response["data"]["size"];
    if (notificationSize == 0) {
      notificationEnter = true;
    }
    update();
  }

  @override
  getNotification() async {
    saveStatusRequest = statusRequest.loading;
    var response = await HomeRemote.getNotification(
        allNotificationSize, allNotification.length);
    saveStatusRequest = await handleingReposnr(response);

    print("-----------------------------------");
    print(response);
    allNotificationSize = response["data"]["size"];
    allNotification = response["data"]["notification"];
    notificationEnter = true;

    update();
  }

  @override
  save() async {
    saveStatusRequest = statusRequest.loading;
    String Link = "${links.allJobs}?type=$typesValue";
    if (jobTitleValue != "Job Title") {
      final int index1 =
          jobTitles.indexWhere(((e) => e["title"] == jobTitleValue));
      var x = jobTitles[index1]["id"];
      Link += "&jobTitle=$x";
    }
    if (jobTypesValue != "Job Type") Link += "&jobType=$jobTypesValue";
    if (wayOfWorkValue != "the way of work") {
      Link += "&wayOfWork=$wayOfWorkValue";
    }
    if (salaryValue != "salary") Link += "&salary=$salaryValue";
    if (companyValue != "company") {
      final int index1 = company.indexWhere(((e) => e.title == companyValue));
      var x = company[index1]["id"];
      Link += "&comapny=$x";
    }

    var response = await HomeRemote.save(Link);

    saveStatusRequest = await handleingReposnr(response);
    if (statusRequest.success == saveStatusRequest) {
      print(response["data"]);
      all = response["data"];
      print(all);
    } else {
      print(response["type"]);
    }
    update();
  }

//------------------------------------------------------------
  @override
  changeTypes(String val) {
    // TODO: implement changeJobTitle
    typesValue = val;
    update();
  }

//------------------------------------------------------------
  @override
  changeJobType(String val) {
    // TODO: implement changeJobTitle
    jobTypesValue = val;
    update();
  }

//------------------------------------------------------------
  @override
  changeWayOfWork(String val) {
    // TODO: implement changeJobTitle
    wayOfWorkValue = val;
    update();
  }

//------------------------------------------------------------
  @override
  changeSalary(String val) {
    // TODO: implement changeJobTitle
    salaryValue = val;
    update();
  }

  // -------------------------------------------------------------------------
  @override
  changeCompany(String val) {
    // TODO: implement changeJobTitle
    companyValue = val;
    update();
  }

  @override
  getcompany() async {
    companyStatusRequest = statusRequest.loading;
    var response = await HomeRemote.getCompany();

    companyStatusRequest = await handleingReposnr(response);
    if (statusRequest.success == companyStatusRequest) {
      company.addAll(response["data"]);
    }
    update();
  }

//--------------------------------------------------------------
  @override
  changeJobTitle(String val) {
    jobTitleValue = val;
    update();
  }

  @override
  ersaeJop(index, id) async {
    Saved.removeAt(index);
    update();
    var response = await HomeRemote.bookMark(id);
  }

  logout() async {
    Get.offAllNamed(AppRoute.login);

    await HomeRemote.logout();
  }

  @override
  getJobTitle() async {
    jobStatusRequest = statusRequest.loading;
    var response = await HomeRemote.getJobs();

    jobStatusRequest = await handleingReposnr(response);
    if (statusRequest.success == jobStatusRequest) {
      jobTitles.addAll(response["data"]);
    } else {}
    update();
  }

  @override
  changePage(int index) {
    if (index == 2 && !first) {
      typesValue = "FeaturedJobs";
      all = Feature;
      first = true;
    }
    currentPage = index;
    update();
  }

  @override
  viewAll(to) {
    if (to) {
      all = Feature;
    } else {
      all = Recommended;
    }
    currentPage = 2;
    update();
  }

  @override
  bookmark(String id, bool type, int index) async {
    if (type) {
      if (Feature[index]["userJobs"].length > 0) {
        Feature[index]["userJobs"].clear();
      } else {
        Feature[index]["userJobs"].length = 5;
        Saved.add(Feature[index]);
      }
    } else {
      if (Recommended[index]["userJobs"].length > 0) {
        Recommended[index]["userJobs"].clear();
      } else {
        Recommended[index]["userJobs"].length = 5;
        Saved.add(Feature[index]);
      }
    }

    update();
    var response = await HomeRemote.bookMark(id);
  }

  @override
  FeatureJobs() async {
    homeStatusRequest = statusRequest.loading;
    var response = await HomeRemote.featureJobs(Feature.length);
    homeStatusRequest = await handleingReposnr(response);
    print("opopopopopop");
    print(homeStatusRequest);
    if (statusRequest.success == homeStatusRequest) {
      Feature.addAll(response["data"]["FeaturedJobs"]);
      featureSize = response["data"]["size"];
    } else if (statusRequest.notAutherized == homeStatusRequest) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.clear();
      Get.offAllNamed(AppRoute.login);
    }
    update();
  }

  @override
  RecommendedJobs() async {
    homeStatusRequest = statusRequest.loading;
    var response = await HomeRemote.recommendedJobs(Recommended.length);

    homeStatusRequest = await handleingReposnr(response);

    if (statusRequest.success == homeStatusRequest) {
      print("pppppppopopopopppppop");
      print(response["data"]);
      Recommended.addAll(response["data"]["RecommendedJobs"]);
    } else if (statusRequest.notAutherized == homeStatusRequest) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.clear();
      Get.offAllNamed(AppRoute.login);
    }
    update();
  }

  savedJobs() async {
    var response = await HomeRemote.saved();
    print(";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;");
    Saved.addAll(response["data"]["savedJobs"]);
    update();
  }

  @override
  getUserData() async {
    await preference().getUserData().then((value) {
      List list = value;
      userData = list[0];
    });
  }

  toSaved() {
    Get.toNamed(AppRoute.saved);
  }

  scrollListener() {
    scroll.addListener(() async {
      if (((scroll.offset / scroll.position.maxScrollExtent) * 100) <= 80.0 &&
          !scroll.position.outOfRange &&
          featureSize != Feature.length &&
          scrollStatusRequest != statusRequest.loading) {
        scrollStatusRequest = statusRequest.loading;
        await FeatureJobs();
        scrollStatusRequest = statusRequest.static;
        update();
      }
    });
  }

  notificationScrollListener() {
    notificationScroll.addListener(() async {
      if (((notificationScroll.offset /
                      notificationScroll.position.maxScrollExtent) *
                  100) <=
              80.0 &&
          !notificationScroll.position.outOfRange &&
          featureSize != Feature.length &&
          scrollStatusRequest != statusRequest.loading) {
        scrollStatusRequest = statusRequest.loading;
        if (allNotificationSize > allNotification.length) {
          await getNotification();
        }
        scrollStatusRequest = statusRequest.static;
        update();
      }
    });
  }

  changeSearch() async {
    print(
        "----------------------------------------------------------------------");
    print(search.text);
    if (search.text != "") {
      print("enter");
      change = true;
      searchStatusRequest = statusRequest.loading;
      var response = await HomeRemote.search(search.text);
      print(response);
      SearchList.addAll(response['data']);
      searchStatusRequest = statusRequest.success;
    } else {
      change = false;
    }
    update();
  }

  @override
  void goToApplay(data) {
    data["applayJobs"].length > 0
        ? alreadyApplayed = true
        : alreadyApplayed = false;
    applay = data;
    print("/*//**/**//*/*//*/*/*/**//**/*//*/**//*//*/*/*/**/*//*/*/*");
    print(applay);
    update();
    Get.toNamed(AppRoute.applay);
  }

  @override
  void onInit() {
    getUserData();
    FeatureJobs();
    RecommendedJobs();
    getJobTitle();
    savedJobs();
    getcompany();
    getNotificationNumber();
    getNotification();
    search = TextEditingController();
    scrollListener();
    notificationScrollListener();
    super.onInit();
  }

  @override
  void dispose() {
    search.clear();
    super.dispose();
  }
  // -> to got to login
//  loginRemote LoginRemote = loginRemote(Get.find());
}
