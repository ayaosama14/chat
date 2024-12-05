import 'dart:ui';

import 'package:chating_app/fetchers/auth/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/chat_text.dart';
import '../../../core/custom_textfield.dart';
import '../../../core/spacer.dart';

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
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_outlined),
          ),
          centerTitle: true,
          title: const Text(
            "Chat",
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return bubbleChat(
                    text: 'hello aya how you doing gi',
                    textColor: AppColor.white,
                    containerChatColor: AppColor.mainChat,
                  );
                },
              
                // textChat(text: 'hello aya',
                //   textColor: AppColor.white, containerChatColor: AppColor.mainChat,) ,
                // spacerH12,
                // textChat(text: 'hello im osama how are you',
                //   textColor: AppColor.white, containerChatColor: AppColor.secChat,) ,
              ),
            ),
            spacerH6,
            customSuffixTextField()


          ],
        ),
      ),
    );
  }
}
