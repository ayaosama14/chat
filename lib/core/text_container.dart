
// import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import 'app_colors.dart';

Widget textContainer({required BuildContext context ,required String text }){
  return Container(
    padding: const EdgeInsets.all(6),
    margin: const EdgeInsets.all(10),
    width:MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
      color: AppColor.white,
      borderRadius: BorderRadius.all(
        Radius.circular(6.0),
      ),
    ),
    child: Text(
      text
          //.tr(),
// style: AppStyle.boldBlackTextStyle20,
     , style: Theme.of(context).textTheme.bodyLarge,
      textAlign: TextAlign.start,
      maxLines: 1,
    ),
  );
}
