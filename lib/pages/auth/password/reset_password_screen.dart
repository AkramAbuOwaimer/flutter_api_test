import 'package:flutter/material.dart';
import 'package:flutter_api_test/services/api/controllers/student_api_controller.dart';
import 'package:flutter_api_test/utils/helpers.dart';
import 'package:flutter_api_test/widgets/app_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({Key? key, required this.email}) : super(key: key);

  final String email;
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late FocusNode _firstCodeFocusNode;
  late FocusNode _secondCodeFocusNode;
  late FocusNode _thirdCodeFocusNode;
  late FocusNode _forthCodeFocusNode;

  late TextEditingController _passwordTextEditingController;
  late TextEditingController _passwordConfirmationTextEditingController;

  late TextEditingController _firstCodeTextEditingController;
  late TextEditingController _secondCodeTextEditingController;
  late TextEditingController _thirdCodeTextEditingController;
  late TextEditingController _forthCodeTextEditingController;

  @override
  void initState() {
    super.initState();
    _firstCodeFocusNode = FocusNode();
    _secondCodeFocusNode = FocusNode();
    _thirdCodeFocusNode = FocusNode();
    _forthCodeFocusNode = FocusNode();
    _passwordTextEditingController = TextEditingController();
    _passwordConfirmationTextEditingController = TextEditingController();

    _firstCodeTextEditingController = TextEditingController();
    _secondCodeTextEditingController = TextEditingController();
    _thirdCodeTextEditingController = TextEditingController();
    _forthCodeTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _firstCodeFocusNode.dispose();
    _secondCodeFocusNode.dispose();
    _thirdCodeFocusNode.dispose();
    _forthCodeFocusNode.dispose();

    _passwordTextEditingController.dispose();
    _passwordConfirmationTextEditingController.dispose();

    _firstCodeTextEditingController.dispose();
    _secondCodeTextEditingController.dispose();
    _thirdCodeTextEditingController.dispose();
    _forthCodeTextEditingController.dispose();
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
            'Reset Password',
            style: TextStyle(
              fontSize: 28,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          children: <Widget>[
            const Text(
              'Reset your password ...',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Enter your email, code & new password',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 60,
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: TextField(
                    controller: _firstCodeTextEditingController,
                    focusNode: _firstCodeFocusNode,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        counterText: '',
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide.none)),
                    minLines: null,
                    maxLines: null,
                    expands: true,
                    onChanged: (String input) {
                      if (input.length == 1) {
                        _secondCodeFocusNode.requestFocus();
                      }
                    },
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: TextField(
                    controller: _secondCodeTextEditingController,
                    focusNode: _secondCodeFocusNode,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        counterText: '',
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide.none)),
                    minLines: null,
                    maxLines: null,
                    expands: true,
                    onChanged: (String input) {
                      if (input.length == 1) {
                        _thirdCodeFocusNode.requestFocus();
                      }
                    },
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: TextField(
                    controller: _thirdCodeTextEditingController,
                    focusNode: _thirdCodeFocusNode,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        counterText: '',
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide.none)),
                    minLines: null,
                    maxLines: null,
                    expands: true,
                    onChanged: (String input) {
                      if (input.length == 1) {
                        _forthCodeFocusNode.requestFocus();
                      }
                    },
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: TextField(
                    controller: _forthCodeTextEditingController,
                    focusNode: _forthCodeFocusNode,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        counterText: '',
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide.none)),
                    minLines: null,
                    maxLines: null,
                    expands: true,
                    onChanged: (String input) {
                      if (input.length == 1) {}
                    },
                  )),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            // AppTextField(
            //   controller: _emailTextEditingController,
            //   keyboardType: TextInputType.emailAddress,
            //   labelText: 'Email',
            //   prefixIcon: Icons.email,
            // ),
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
              height: 15,
            ),
            AppTextField(
              controller: _passwordConfirmationTextEditingController,
              keyboardType: TextInputType.visiblePassword,
              labelText: 'Confirm Password',
              prefixIcon: Icons.lock,
              obscure: true,
            ),
            const SizedBox(
              height: 5,
            ),
            // GestureDetector(
            //   onTap: () =>
            //       Navigator.pushNamed(context, '/forget_password_screen'),
            //   child: RichText(
            //     text: const TextSpan(
            //       text: 'Forgot Password?',
            //       children: [
            //         TextSpan(text: ' '),
            //         TextSpan(text: 'Reset Now ..'),
            //       ],
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () async {
                await performResetPassword();
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
                'Reset',
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

  Future performResetPassword() async {
    if (checkData() && checkCode()) {
      if (_passwordTextEditingController.text ==
          _passwordConfirmationTextEditingController.text) {
        await resetPassword();
      } else {
        Helpers.showSnackBar(
            context: context,
            message: 'Password confirmation error',
            error: true);
      }
    }
  }

  bool checkData() {
    if (_passwordTextEditingController.text.isNotEmpty &&
        _passwordConfirmationTextEditingController.text.isNotEmpty) {
      return true;
    }
    Helpers.showSnackBar(
        context: context, message: "Fill the password fields", error: true);
    return false;
  }

  bool checkCode() {
    if (_firstCodeTextEditingController.text.isNotEmpty &&
        _secondCodeTextEditingController.text.isNotEmpty &&
        _thirdCodeTextEditingController.text.isNotEmpty &&
        _forthCodeTextEditingController.text.isNotEmpty) {
      return true;
    }
    Helpers.showSnackBar(context: context, message: "Fill the code fields");
    return false;
  }

  Future resetPassword() async {
    bool isReset = await StudentApiController().resetPassword(context,
        email: widget.email,
        code: getCode(),
        password: _passwordTextEditingController.text,
        passwordConfirmation: _passwordConfirmationTextEditingController.text);
    if (isReset) {
      Navigator.pop(context);
    }
  }

  String getCode() {
    return _firstCodeTextEditingController.text +
        _secondCodeTextEditingController.text +
        _thirdCodeTextEditingController.text +
        _forthCodeTextEditingController.text;
  }
}
