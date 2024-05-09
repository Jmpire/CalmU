import 'package:flutter/material.dart';

class AppColors {
  static int? setDark;
  static Color? primaryColor;
  static Color? background;
  static Color? darkBlue;
  static Color? subText;
  static Color? lightgrey;
  static Color? orange;
  static Color? container;
  static Color? whiteText;
  static Color? blackText;
  static Color? lightBlue;
  static Color? grey;
  static Color? textField;
  static Color? signInButtons;
  static Color? dividers;
  static Color? alerts;
  static Color? buttons;
  static Color? logo;

  AppColors(int nKey) {
    setDark = nKey;
    if (nKey == 3) {
      primaryColor = const Color(0xffFFFFFF);
      textField = const Color(0xffFFFFFF);
      background = const Color(0xff0B141B);
      lightgrey = const Color(0xffF5F5F5);
      darkBlue = const Color(0xff192734);
      subText = const Color(0xff7E7A7A);
      orange = const Color(0xffF88B30);
      logo = const Color(0xffFFFFFF);
      container = const Color(0xff7E7A7A);
      whiteText = const Color(0xff000000);
      blackText = const Color(0xffFFFFFF);
      signInButtons = const Color(0xff000000);
      dividers = Colors.grey.shade900;
      alerts = const Color(0xffF88B30);
      buttons = const Color(0xffF88B30);
      

    } else if(nKey == 0){
      logo = const Color(0xffF88B30);
      primaryColor = const Color(0xff000000);
      background = const Color(0xffFFFFFF);
      darkBlue = const Color(0xff192734);
      subText = const Color(0xff7E7A7A);
      lightgrey = const Color(0xff263238);
      orange = const Color(0xffF88B30);
      container = const Color(0xffF5F5F5);
      whiteText = const Color(0xffFFFFFF);
      blackText = const Color(0xff000000);
      lightBlue = const Color(0xff263238);
      grey = const Color(0xff7E7A7A);
      textField = const Color(0xff7E7A7A);
      signInButtons = const Color(0xffF5F5F5);
      dividers = Colors.grey.shade200;
       alerts = Colors.white;
       buttons = Colors.black;

    }
  }
  
}
