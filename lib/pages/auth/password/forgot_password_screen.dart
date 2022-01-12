import 'package:flutter/material.dart';
import 'package:flutter_api_test/pages/auth/password/reset_password_screen.dart';
import 'package:flutter_api_test/services/api/controllers/student_api_controller.dart';
import 'package:flutter_api_test/utils/helpers.dart';
import 'package:flutter_api_test/widgets/app_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController _emailTextEditingController;

  @override
  void initState() {
    super.initState();
    _emailTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
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
            'Forget Password',
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
              'Forgot password ?',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Enter your email to recieve reset code',
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
              height: 25,
            ),
            ElevatedButton(
              onPressed: () async {
                await performForgetPassword();
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
                'Send Code',
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

  Future performForgetPassword() async {
    if (checkData()) {
      await forgetPassword();
    } else {
      Helpers.showSnackBar(
          context: context, message: 'Enter email address', error: true);
    }
  }

  Future forgetPassword() async {
    var isSubmited = await StudentApiController()
        .forgetPassword(context, email: _emailTextEditingController.text);
    if (isSubmited) {
      Helpers.showSnackBar(context: context, message: "Login success");
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ResetPasswordScreen(
                    email: _emailTextEditingController.text)));
      });
    }
  }

  bool checkData() {
    if (_emailTextEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }
}
