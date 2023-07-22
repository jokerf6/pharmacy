import 'package:get/get.dart';

validationInput(String val, String val2, int min, int max, String type) {
  if (type == 'confirmPassword' && val != val2) {
    return "Passwords donot natch";
  }
  if (type == 'name') {
    for (int i = 0; i < val.length; i++) {
      if (val[i].isNum) {
        return "Must Be charcters only";
      }
    }
  }
  if (type == 'email' &&
      !RegExp(r'^[\w\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(val)) {
    return "Not valid Email";
  }
  if (type == 'password') {
    int x = 0;
    final String x1 = val.toLowerCase();
    final String x2 = val.toUpperCase();

    for (int i = 0; i < val.length; i++) {
      if (val[i] != x1[i]) {
        x++;
        break;
      }
    }
    if (x == 0) {
      return "Must have at least 1 lowercase letter";
    }
    for (int i = 0; i < val.length; i++) {
      if (val[i] != x2[i]) {
        x++;
        break;
      }
    }
    if (x == 1) {
      return "Must have at least 1 uppercase letter";
    }

    for (int i = 0; i < val.length; i++) {
      if (val[i] == "=" ||
          val[i] == "|" ||
          val[i] == ">" ||
          val[i] == "<" ||
          val[i] == "+" ||
          val[i] == "-" ||
          val[i] == "_" ||
          val[i] == "*" ||
          val[i] == ")" ||
          val[i] == "(" ||
          val[i] == "*" ||
          val[i] == "&" ||
          val[i] == "^" ||
          val[i] == "%" ||
          val[i] == "\$" ||
          val[i] == "#" ||
          val[i] == "@" ||
          val[i] == "!") {
        x++;
        break;
      }
    }
    if (x == 2) {
      return "Must have at least 1 Special Character";
    }
    for (int i = 0; i < val.length; i++) {
      if (val[i] == "0" ||
          val[i] == "1" ||
          val[i] == "2" ||
          val[i] == "3" ||
          val[i] == "4" ||
          val[i] == "5" ||
          val[i] == "6" ||
          val[i] == "7" ||
          val[i] == "8" ||
          val[i] == "9") {
        x++;
        break;
      }
    }
    if (x == 3) {
      return "Must have at least 1 Number";
    }
  }
  if (val.isEmpty) {
    return "Cannot be empty";
  }
  if (val.length < min) {
    return "Cannot be less than $min";
  }
  if (val.length > max) {
    return "Cannot be bigger than $max";
  }
  return "";
}
