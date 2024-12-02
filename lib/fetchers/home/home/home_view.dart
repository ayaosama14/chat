import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static const String id = "home_view";
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading:IconButton(onPressed: (){
        Navigator.of(context).pop();
      }, icon: Icon(Icons.arrow_back_outlined))),
    );
  }
}
//C:\Program Files\Java\jdk-21\bin  