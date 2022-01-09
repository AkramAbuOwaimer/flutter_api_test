import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.keyboardType = TextInputType.text,
    required this.labelText,
    required this.prefixIcon,
    this.obscure = false,
    required this.controller,
  }) : super(key: key);

  final TextInputType keyboardType;
  final String labelText;
  final IconData prefixIcon;
  final bool obscure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: Colors.black38,
      style: const TextStyle(color: Colors.black, fontSize: 20),
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(color: Colors.black, fontSize: 23),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(width: 2, color: Colors.white),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(width: 2, color: Colors.white),
        ),
        labelText: labelText,
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.black38,
        ),
        suffix: Icon(Icons.check),
      ),
      obscureText: obscure,
    );
  }
}
