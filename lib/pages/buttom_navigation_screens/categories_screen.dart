import 'package:flutter/material.dart';
import 'package:flutter_api_test/models/Category.dart';
import 'package:flutter_api_test/services/api/controllers/category_api_controller.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late Future<List<Category>> _futureCategories;
  List<Category> _categories = [];

  @override
  void initState() {
    super.initState();
    _futureCategories = CategoryApiController().indexCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
        future: _futureCategories,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              _categories = snapshot.data ?? [];
              return ListView.builder(
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    var _category = _categories.elementAt(index);
                    return ListTile(
                      leading: Icon(Icons.category),
                      title: Text('${_category.title}'),
                      subtitle: Text(_category.description),
                      trailing: Icon(Icons.arrow_forward_ios),
                    );
                  });
            } else {
              return Center(
                child: Column(
                  children: [
                    Icon(Icons.warning),
                    Text(
                      'No Data',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            }
          }
        });
  }
}
