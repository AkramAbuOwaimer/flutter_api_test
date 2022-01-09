import 'dart:convert';

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
}
