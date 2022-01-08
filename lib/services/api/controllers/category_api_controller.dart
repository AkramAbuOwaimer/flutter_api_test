import 'dart:convert';
import 'package:flutter_api_test/models/Category.dart';
import 'package:flutter_api_test/services/api/api_settings.dart';
import 'package:http/http.dart' as http;

class CategoryApiController {
  Future<List<Category>> indexCategories() async {
    var url = Uri.parse(ApiSettings.categoriesIndex);
    var response = await http.get(url);
    print('Response: $response');
    if (response.statusCode == 200) {
      var _json = jsonDecode(response.body);
      var _categories =
          List.from(_json['data']).map((e) => Category.fromJson(e)).toList();
      return _categories;
    }
    return <Category>[];
  }
}
