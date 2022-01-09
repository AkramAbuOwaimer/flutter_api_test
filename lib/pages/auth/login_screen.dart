import 'package:flutter/material.dart';
import 'package:flutter_api_test/services/api/controllers/student_api_controller.dart';
import 'package:flutter_api_test/utils/helpers.dart';
import 'package:flutter_api_test/widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: AlignmentDirectional.topEnd,
              end: AlignmentDirectional.bottomStart,
              colors: [
            Colors.blue.shade700,
            Colors.blue.shade200,
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Login',
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: <Widget>[
            const Text(
              'Welcome Back ...',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Enter your email & password',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            AppTextField(
              controller: _emailTextEditingController,
              keyboardType: TextInputType.emailAddress,
              labelText: 'Email',
              prefixIcon: Icons.email,
            ),
            const SizedBox(
              height: 15,
            ),
            AppTextField(
              controller: _passwordTextEditingController,
              keyboardType: TextInputType.visiblePassword,
              labelText: 'Password',
              prefixIcon: Icons.lock,
              obscure: true,
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () async {
                await performLogin();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future performLogin() async {
    if (checkData()) {
      login();
    }
  }

  bool checkData() {
    if (_emailTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty) {
      return true;
    }
    Helpers.showSnackBar(
        context: context, message: 'Enter Email & Password', error: true);
    return false;
  }

  Future login() async {
    var isLogedIn = await StudentApiController().login(context,
        _emailTextEditingController.text, _passwordTextEditingController.text);
    if (isLogedIn) {
      Helpers.showSnackBar(context: context, message: "Login success");
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, '/main_screen');
      });
    }
  }
}
