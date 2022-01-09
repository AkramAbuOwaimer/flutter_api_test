import 'dart:convert';

class Student {
  final int id;
  final String fullName;
  final String email;
  final String gender;
  final String? fcmToken;
  final String token;
  final String refreshToken;
  final bool isActive;
  Student({
    required this.id,
    required this.fullName,
    required this.email,
    required this.gender,
    this.fcmToken,
    required this.token,
    required this.refreshToken,
    required this.isActive,
  });

  Student copyWith({
    int? id,
    String? fullName,
    String? email,
    String? gender,
    String? fcmToken,
    String? token,
    String? refreshToken,
    bool? isActive,
  }) {
    return Student(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      fcmToken: fcmToken ?? this.fcmToken,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'gender': gender,
      'fcm_token': fcmToken,
      'token': token,
      'refresh_token': refreshToken,
      'is_active': isActive,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id']?.toInt() ?? 0,
      fullName: map['full_name'] ?? '',
      email: map['email'] ?? '',
      gender: map['gender'] ?? '',
      fcmToken: map['fcm_token'],
      token: map['token'] ?? '',
      refreshToken: map['refresh_token'] ?? '',
      isActive: map['is_active'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Object(id: $id, full_name: $fullName, email: $email, gender: $gender, fcm_token: $fcmToken, token: $token, refresh_token: $refreshToken, is_active: $isActive)';
  }
}
