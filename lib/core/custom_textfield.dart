import 'dart:ui';

import 'package:flutter/material.dart';

customSuffixTextField (){return  TextFormField(
  selectionHeightStyle: BoxHeightStyle.tight,
  // obscureText: isSecure!,
  // onSaved: onSaved,
  // controller: myController,
  // keyboardType: keyboardType,
  // validator: validator,
  decoration: InputDecoration(

    suffixIcon: IconButton(onPressed: (){},
      icon:  const Icon(Icons.send),),
    hintText:'write message',
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
);}