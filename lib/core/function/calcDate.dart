int getDaysInMonth(int year, int month) {
  if (month == DateTime.february) {
    final bool isLeapYear =
        (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
    return isLeapYear ? 29 : 28;
  }
  const List<int> daysInMonth = <int>[
    31,
    -1,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];
  return daysInMonth[month - 1];
}

calcDate(String date) {
  String hour = date.split("T")[1].split(":")[0];
  print(hour);

  int min = int.parse(date.split("T")[1].split(":")[1]);
  print(min);

  int year = int.parse(date.split("T")[0].split("-")[0]);
  int mon = int.parse(date.split("T")[0].split("-")[1]);
  int day = int.parse(date.split("T")[0].split("-")[2]);
  print(day);
  print(mon);
  print(year);

  int hour2 = int.parse(hour) + 2;
  if (hour2 > 24) {
    hour2 -= 24;
    day++;
    if (day > getDaysInMonth(year, mon)) {
      mon++;
      day = 1;
    }
    if (mon > 12) {
      day = 1;
      mon = 1;
      year++;
    }
  }
  DateTime yourDate = DateTime(
    year,
    mon,
    day,
    hour2,
    min,
  );
  DateTime now = DateTime.now();
  int hour3 = now.hour + 2;
  int day3 = now.day;
  int mon3 = now.month;
  int year3 = now.year;

  if (hour3 > 24) {
    hour3 -= 24;
    day3++;
    if (day3 > getDaysInMonth(year3, mon3)) {
      mon3++;
      day3 = 1;
    }
    if (mon3 > 12) {
      day3 = 1;
      mon3 = 1;
      year3++;
    }
  }
  print("${year3}, ${mon3}, ${day3}, ${hour3}, ${now.minute}");
  DateTime now2 = DateTime(year3, mon3, day3, hour3, now.minute);
  Duration diff = now2.difference(yourDate);
  print((diff.inHours).toInt());
  print((diff.inDays).toInt() ~/ 365);

  if (diff.inDays > 0) {
    if (diff.inDays ~/ 365 != 0) {
      if (diff.inDays ~/ 365 == 1) {
        return "${diff.inDays ~/ 365}  year ago";
      } else {
        return "${diff.inDays ~/ 365}  years ago";
      }
    } else if (diff.inDays.toInt() ~/ 30 != 0) {
      if (diff.inDays ~/ 30 == 1) {
        return "${diff.inDays ~/ 30}  mon ago";
      } else {
        return "${diff.inDays ~/ 30}  mons ago";
      }
    } else if (diff.inDays ~/ 7 != 0) {
      if ((diff.inDays).toInt() ~/ 7 == 1) {
        return "1 week ago";
      } else {
        return "${(diff.inDays).toInt() ~/ 7}  weeks ago";
      }
    }
  } else if ((diff.inHours).toInt() != 0) {
    if (diff.inHours == 1) {
      return "1 hour ago";
    } else {
      return "${diff.inHours}  hours ago";
    }
  } else {
    return "${diff.inMinutes}  min ago";
  }
}
