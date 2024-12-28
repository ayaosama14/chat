
import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

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
  TextEditingController chatController=TextEditingController();
 // final supabase = Supabase.instance.client;
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
            FutureBuilder(
              future: null,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return  Expanded(
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
              );
            },
    ),

            spacerH6,

            customSuffixTextField(
             controller :chatController,
                onPressed:() async {
                // Select data with filters
                //   final data = await supabase
                //       .from('messages')
                //       .insert([
                //     { 'message': chatController.text  },
                //   ])
                //       .select();

//osama saied 1-before sending message pic remanme it to uni code uni
                  // 2. upload pic to storage
                  //3. upload link to my database table
                  //another solution:
                  //     msg: "msg text......",
                  //     attachment:[{
                  //         path:"userImage/hjajshjashjash.jpg",
                  //         uploadedDate: 2024-04-22
                  //     }]
                  // }
                chatController.clear();

              },
            )


          ],),

      ),
    );
  }
}
