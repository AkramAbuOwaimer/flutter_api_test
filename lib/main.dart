import 'package:flutter/material.dart';
import 'package:flutter_api_test/pages/auth/login_screen.dart';
import 'package:flutter_api_test/pages/launch_screen.dart';
import 'package:flutter_api_test/pages/main_screen.dart';
import 'package:flutter_api_test/storage/student_shared_pref_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StudentSharedPrefController().initSharedPref();
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

        // * Auth
        '/login_screen': (context) => LoginScreen(),
      },
    );
  }
}
