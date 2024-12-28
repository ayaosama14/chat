
import 'package:flutter/material.dart';

import 'core/theme.dart';

import 'fetchers/auth/view/login_view.dart';
import 'fetchers/auth/view/otp_view.dart';
import 'fetchers/auth/view/phone_view.dart';
import 'fetchers/auth/view/register_view.dart';
import 'fetchers/home/home/home_view.dart';


class MyChatApp extends StatelessWidget {
  const MyChatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner:false,
        title: 'Flutter chat app',
        theme: appThemeLight(),
        initialRoute: LoginView.id,
        routes: {
          LoginView.id: (BuildContext context) =>  LoginView(),
          RegisterView.id: (BuildContext context) => const RegisterView(),
          HomeView.id: (BuildContext context) =>  const HomeView(),
          PhoneView.id:(BuildContext context) =>PhoneView(),
          OtpView.id:(BuildContext context) =>OtpView(),
        },
        home:  LoginView());
  }
}
