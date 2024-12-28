import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Container bubbleChat({
  required String text,
  required Color textColor,
  required Color containerChatColor,
}) {
 return  Container(
   // alignment: AlignmentDirectional(start, y),
   margin:const EdgeInsets.all(6.0) ,
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: containerChatColor,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    child: Text(
      text,
      style: TextStyle(color: textColor),
    ),
  );
}
