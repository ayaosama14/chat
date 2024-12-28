// ignore: must_be_immutable
import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String hint;
  Widget ?prefixIcon;
  Widget? suffixIcon;
  bool? isSecure;
  String? Function(String?)? validator;
  void Function(String?)? onSaved;
  TextEditingController? myController;
  TextInputType? keyboardType;
  CustomTextField(
      {super.key,
      required this.hint,
       this.prefixIcon,
      this.suffixIcon,
      this.onSaved,
      this.validator,
      this.isSecure = false,
        this.keyboardType,
      this.myController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      selectionHeightStyle: BoxHeightStyle.tight,
      obscureText: isSecure!,
      onSaved: onSaved,
      controller: myController,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
       prefixIcon:prefixIcon,
       suffixIcon: suffixIcon,
       hintText: hint,
        hintStyle: const TextStyle(color: Colors.black),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlue),
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
