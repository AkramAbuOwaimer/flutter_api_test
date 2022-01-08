import 'package:flutter/material.dart';
import 'package:flutter_api_test/pages/launch_screen.dart';
import 'package:flutter_api_test/pages/main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => LaunchScreen(),
        '/main_screen': (context) => MainScreen(),
      },
    );
  }
}
