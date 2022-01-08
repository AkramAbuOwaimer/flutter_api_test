class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.bio,
    required this.jobTitle,
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.image,
    required this.active,
    required this.emailVerifiedAt,
    required this.imagesCount,
  });
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String mobile;
  late final String bio;
  late final String jobTitle;
  late final double latitude;
  late final double longitude;
  late final String country;
  late final String image;
  late final int active;
  late final String emailVerifiedAt;
  late final int imagesCount;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile = json['mobile'];
    bio = json['bio'];
    jobTitle = json['job_title'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    country = json['country'];
    image = json['image'];
    active = json['active'];
    emailVerifiedAt = json['email_verified_at'];
    imagesCount = json['images_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['mobile'] = mobile;
    _data['bio'] = bio;
    _data['job_title'] = jobTitle;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['country'] = country;
    _data['image'] = image;
    _data['active'] = active;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['images_count'] = imagesCount;
    return _data;
  }
}
