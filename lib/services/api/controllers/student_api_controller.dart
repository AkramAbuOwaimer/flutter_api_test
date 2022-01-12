import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_api_test/models/student.dart';
import 'package:flutter_api_test/services/api/api_settings.dart';
import 'package:flutter_api_test/storage/student_shared_pref_controller.dart';
import 'package:flutter_api_test/utils/helpers.dart';
import 'package:http/http.dart' as http;

class StudentApiController {
  Future<bool> login(
      BuildContext context, String email, String password) async {
    var url = Uri.parse(ApiSettings.studentLogin);
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
    });
    if (response.statusCode == 200) {
      Student student = Student.fromMap(jsonDecode(response.body)['object']);
      StudentSharedPrefController().save(student);
      return true;
    } else if (response.statusCode == 400) {
      Helpers.showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
    }
    return false;
  }

  Future<bool> logout() async {
    var f = StudentSharedPrefController().getToken();
    var url = Uri.parse(ApiSettings.studentLogout);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: StudentSharedPrefController().getToken(),
      HttpHeaders.acceptHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      StudentSharedPrefController().logout();
      return true;
    } else if (response.statusCode == 401) {
      StudentSharedPrefController().logout();
      return true;
    }
    return false;
  }

  Future<bool> forgetPassword(BuildContext context,
      {required String email}) async {
    var url = Uri.parse(ApiSettings.studentForgetPassword);
    var response = await http.post(url, body: {
      'email': email,
    });
    if (response.statusCode == 200) {
      Helpers.showSnackBar(
          context: context, message: jsonDecode(response.body)['message']);
      print('Code: ${jsonDecode(response.body)['code']}');
      return true;
    }
    Helpers.showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true);
    return false;
  }

  Future<bool> resetPassword(
    BuildContext context, {
    required String email,
    required String code,
    required String password,
    required String passwordConfirmation,
  }) async {
    var url = Uri.parse(ApiSettings.studentResetPassword);
    var response = await http.post(url, body: {
      'email': email,
      'code': code,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });
    if (response.statusCode == 200) {
      Helpers.showSnackBar(
          context: context, message: jsonDecode(response.body)['message']);
      return true;
    }
    Helpers.showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true);
    return false;
  }
}
