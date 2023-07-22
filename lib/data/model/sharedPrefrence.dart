import 'dart:convert';

import 'package:MyCareer/data/model/user.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class preference {
  Future<void> saveUserData(userInfo user) async {
    List<userInfo> list = [];

    list.add(user);
    saveUser(list);
  }

  Future<void> saveUser(List<userInfo> list) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> listPref = list.map((e) => jsonEncode(e.toMap())).toList();
    await prefs.setStringList("userData", listPref);
  }

  Future<List<userInfo>> getUserData() async {
    List<userInfo> list = [];
    final prefs = await SharedPreferences.getInstance();
    List<String>? listPref = prefs.getStringList("userData");
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    print(listPref);
    if (listPref == null) {
      list = list;
    } else {
      list = listPref.map((e) => userInfo.fromJson(jsonDecode(e))).toList();
    }
    return list;
  }
}
