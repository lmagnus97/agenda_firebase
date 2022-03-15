import 'package:flutter/material.dart';

class Styles{

  static const MaterialColor primaryColors = MaterialColor(
    0XFF303030,
    <int, Color>{
      50: Color(0xFF474444),
      100: Color(0xFF403d3d),
      200: Color(0xFF363434),
      300: Color(0xFF302f2f),
      400: Color(0xFF2e2d2d),
      500: Color(0XFF303030),
      600: Color(0xFF1c1c1c),
      700: Color(0xFF171717),
      800: Color(0xFF121212),
      900: Color(0xFF0d0d0d),
    },
  );

  static Color primaryText(){
    return const Color(0xff3e3e3e);
  }

  static Color secondaryText(){
    return const Color(0xff6e6e6e);
  }

  static Color tertiaryText(){
    return const Color(0xff9e9e9e);
  }

  static Color backgroundColor(){
    return const Color(0xfff7f7f7);
  }

}