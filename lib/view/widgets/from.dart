import 'package:flutter/material.dart';
import 'package:tiktok/constants.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData myIcon;
  final String myLabelText;
  final bool hide;

  const LoginTextField({
    Key? key,
    required this.controller,
    required this.myLabelText,
    required this.myIcon,
    required this.hide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: hide,
      controller: controller,
      decoration: InputDecoration(
        prefixIconColor: Colors.white,
        iconColor: Colors.red,
        labelStyle: const TextStyle(color: Colors.white),
        icon: Icon(myIcon),
        labelText: myLabelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
