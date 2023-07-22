class links {
  static const String server = "https://jobb-45md.onrender.com";

  /*=================Auth ================*/
  static const String login = "$server/auth/signin";
  static const String signup = "$server/auth/signup";
  static const String verify = "$server/auth/verify-email";
  static const String logout = "$server/auth/logout";
  static const String forget = "$server/auth/forgetPassword";
  static const String reset = "$server/auth/reset-password";
  static const String change = "$server/auth/change_password";

  /*=================Default ================*/
  static const String cities = "$server/auth/cities";
  static const String company = "$server/company";
  static const String jobs = "$server/auth/jobs";
  static const String upload = "$server/upload/file";

  /*=================jobs ================*/
  static const String allJobs = "$server/job/all";
  static const String featureJobs = "$server/job/all/?type=FeaturedJobs";
  static const String recommendedJobs = "$server/job/all/?type=RecommendedJobs";
  static const String savedJobs = "$server/job/all/?type=Saved";
  static const String bookmark = "$server/job";
  static const String search = "$server/job/search";

  /*=================user ================*/
  static const String editImage = "$server/user/profileImage";
  static const String editUser = "$server/user";

  /*=================notification ================*/
  static const String notificationNumber = "$server/notification/unReadNumber";
  static const String notification = "$server/notification/all";
}
