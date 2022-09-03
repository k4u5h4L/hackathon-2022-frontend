import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryColor = Color(0xFFFFBC03);
  static const Color backgroundColor = Color(0xffEDF1F2);
  static const Color textColor = Colors.blueAccent;
  static const Color grey = Color(0xff737373);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const MaterialAccentColor error = Colors.redAccent;
  static const MaterialColor success = Colors.green;
  static const Color offWhite = Color(0xffE7EBED);
  static const Color darkGrey = Colors.black12;
  static const List<MaterialAccentColor> accents = <MaterialAccentColor>[
    Colors.redAccent,
    Colors.pinkAccent,
    Colors.purpleAccent,
    Colors.deepPurpleAccent,
    Colors.indigoAccent,
    Colors.blueAccent,
    Colors.amberAccent,
    Colors.orangeAccent,
    Colors.deepOrangeAccent,
  ];
  static List<Color> indicatorColors = <Color>[
    Colors.red.shade900,
    Colors.red.shade700,
    Colors.red,
    Colors.orange.shade700,
    Colors.yellow.shade700,
    Colors.yellow,
    Colors.yellow.shade400,
    Colors.green.shade200,
    Colors.green,
    Colors.green.shade700,
    Colors.green.shade900
  ];
}
