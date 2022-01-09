import 'package:flutter_api_test/models/student.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentSharedPrefController {
  static final StudentSharedPrefController _instance =
      StudentSharedPrefController._internal();

  late final SharedPreferences _sharedPreferences;

  factory StudentSharedPrefController() {
    return _instance;
  }
  StudentSharedPrefController._internal();

  Future<void> initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future save(Student student) async {
    await _sharedPreferences.setBool('logged_in', true);
    await _sharedPreferences.setInt('id', student.id);
    await _sharedPreferences.setString('full_name', student.fullName);
    await _sharedPreferences.setString('email', student.email);
    await _sharedPreferences.setString('gender', student.gender);
    await _sharedPreferences.setString('token', student.token);
    await _sharedPreferences.setString('refresh_token', student.refreshToken);
    await _sharedPreferences.setBool('is_active', student.isActive);
  }

  bool isLoggedIn() {
    return _sharedPreferences.getBool('logged_in') ?? false;
  }

  String getToken() {
    String token = _sharedPreferences.getString('token') ?? '';
    return 'bearer $token';
  }

  Future<bool> logout() async {
    return await _sharedPreferences.clear();
  }
}
