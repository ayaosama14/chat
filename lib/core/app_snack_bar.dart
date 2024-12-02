import 'package:flutter/material.dart';

class AppSnackBar {
  static success({required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
  const      SnackBar(content: Text('Data processing correctly'),duration: Duration(seconds: 3),
      ),);
  }

  static failure({context,required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(text) ,duration: const Duration(seconds: 4),
      ),
    );
  }
}
