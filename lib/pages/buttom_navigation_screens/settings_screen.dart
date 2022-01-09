import 'package:flutter/material.dart';
import 'package:flutter_api_test/storage/student_shared_pref_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Settings"),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: const Text(
              "Logout",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              StudentSharedPrefController().logout();
              Navigator.pushReplacementNamed(context, '/launch_screen');
            },
          ),
        ],
      ),
    );
  }
}
