class userInfo {
  final String? id;
  final String? email;
  final String? name;
  final String? subTitle;
  final String? createdAt;
  final String? image;
  final String? accessToken;
  final String? about;
  final String? city;
  final String? cityId;
  final String? jobId;
  final String? view;
  final String? refreshToken;
  final String? github;
  final String? behance;
  final String? cv;

  userInfo(
      {this.id,
      this.email,
      this.name,
      this.image,
      this.subTitle,
      this.accessToken,
      this.createdAt,
      this.about,
      this.city,
      this.cityId,
      this.jobId,
      this.view,
      this.cv,
      this.behance,
      this.github,
      this.refreshToken});

  static userInfo fromJson(Map<String, dynamic> json) => userInfo(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        image: json['image'],
        createdAt: json['createdAt'],
        subTitle: json["subTitle"],
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
        city: json['city'],
        cityId: json['cityId'],
        jobId: json['jobId'],
        about: json['about'],
        view: json['view'],
        github: json['github'],
        behance: json['behance'],
        cv: json['cv'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
      'city': city,
      'cityId': cityId,
      'jobId': jobId,
      'view': view,
      'about': about,
      'subTitle': subTitle,
      'createdAt': createdAt,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'github': github,
      'behance': behance,
      'cv': cv,
    };
  }
}
