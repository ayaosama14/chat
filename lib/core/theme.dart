import 'package:flutter/material.dart';



import 'app_colors.dart';
import 'app_style.dart';

ThemeData appThemeLight() {
  // const Color(0xffabccc3)
  return ThemeData(
      scaffoldBackgroundColor: AppColor.primColor ,
      colorScheme: ColorScheme.light(

          primary: AppColor.primColor, secondary: AppColor.secColor),
      textTheme: const TextTheme(
        bodyLarge: AppStyle.boldColorTextStyle22,
        bodyMedium: AppStyle.boldBlackTextStyle20,
        // bodySmall: AppStyle.textStyle14,
        displayLarge: AppStyle.boldBlackTextStyle20,
        displayMedium: AppStyle.thinTextStyle16,
        displaySmall: AppStyle.greyTextStyle12,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 2,
        centerTitle: true,
        backgroundColor:  AppColor.white,
        titleTextStyle: AppStyle.boldBlackTextStyle20,
      ),
      bottomNavigationBarTheme:  BottomNavigationBarThemeData(
        elevation: 4,
        backgroundColor: AppColor.primColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors. black ,
        selectedLabelStyle:const TextStyle(fontSize: 20,color: Colors.black,fontStyle:FontStyle.normal,),
        unselectedLabelStyle:const TextStyle(fontSize: 16,color: Colors.black45),

        selectedIconTheme: const IconThemeData(size:28,color:AppColor.black),
        //

        showSelectedLabels: true,
        showUnselectedLabels: true,
      )
    // appBarTheme:
  );
}

ThemeData appThemeDark() {
  return ThemeData();
}
