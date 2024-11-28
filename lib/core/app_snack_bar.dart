import 'package:flutter/material.dart';

class AppSnackBar {
  static success(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Processing Data success'),duration: Duration(seconds: 3),
      ),);
  }

  static failure(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Try Again'),duration: Duration(seconds: 3),),
    );
  }
}
