import 'dart:convert';
import 'package:flutter_api_test/models/user.dart';
import 'package:flutter_api_test/services/api/api_settings.dart';
import 'package:http/http.dart' as http;

class UserApiController {
  Future<List<User>> indexUsers() async {
    var url = Uri.parse(ApiSettings.usersIndex);
    var response = await http.get(url);
    print('Response: $response');
    if (response.statusCode == 200) {
      var _json = jsonDecode(response.body);
      var _users =
          List.from(_json['data']).map((e) => User.fromJson(e)).toList();
      return _users;
    }
    return <User>[];
  }
}
