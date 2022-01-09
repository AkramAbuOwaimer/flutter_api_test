import 'package:flutter/material.dart';
import 'package:flutter_api_test/storage/student_shared_pref_controller.dart';

class LaunchScreen extends StatefulWidget {
  LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (StudentSharedPrefController().isLoggedIn()) {
        Navigator.pushReplacementNamed(context, '/main_screen');
      } else {
        Navigator.pushReplacementNamed(context, '/login_screen');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [Colors.blue.shade900, Colors.blue.shade300])),
        child: Text(
          "API Test",
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
