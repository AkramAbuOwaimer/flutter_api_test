import 'package:flutter/material.dart';
import 'package:flutter_api_test/models/buttom_navigation_screen.dart';
import 'package:flutter_api_test/pages/buttom_navigation_screens/categories_screen.dart';
import 'package:flutter_api_test/pages/buttom_navigation_screens/settings_screen.dart';
import 'package:flutter_api_test/pages/buttom_navigation_screens/users_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<ButtomNavigationScreen> _screens = [
    const ButtomNavigationScreen(widget: UsersScreen(), title: 'Users'),
    const ButtomNavigationScreen(
        widget: CategoriesScreen(), title: 'Categories'),
    const ButtomNavigationScreen(widget: SettingsScreen(), title: 'Settings')
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(_screens.elementAt(_selectedIndex).title),
      ),
      body: Container(
        child: _screens.elementAt(_selectedIndex).widget,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        elevation: 4,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'users'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: 'categories'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'settings')
        ],
      ),
    );
  }
}
