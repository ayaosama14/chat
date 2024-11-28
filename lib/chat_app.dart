
import 'package:flutter/material.dart';

import 'fetchers/authintication/view/login_view.dart';
import 'fetchers/authintication/view/register_view.dart';
import 'fetchers/home/views/home_view.dart';

class MyChatApp extends StatelessWidget {
  const MyChatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter chat app',
        theme: ThemeData(scaffoldBackgroundColor: Colors.black12),
        initialRoute: LoginView.id,
        routes: {
          LoginView.id: (BuildContext context) =>  LoginView(),
          RegisterView.id: (BuildContext context) => const RegisterView(),
          HomeView.id: (BuildContext context) => const HomeView(),
        },
        home:  LoginView());
  }
}
