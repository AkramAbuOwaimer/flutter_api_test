import 'package:flutter/material.dart';
import 'package:flutter_api_test/services/api/controllers/student_api_controller.dart';
import 'package:flutter_api_test/storage/student_shared_pref_controller.dart';
import 'package:flutter_api_test/utils/helpers.dart';

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
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: const Text(
              "Logout",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            onPressed: () async {
              bool loggedOut = await StudentApiController().logout();
              if (loggedOut) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/launch_screen', (route) => false);
              } else {
                Helpers.showSnackBar(
                    context: context, message: 'Logout failed', error: true);
              }
            },
          ),
        ],
      ),
    );
  }
}
