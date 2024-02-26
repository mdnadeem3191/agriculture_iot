import 'package:flutter/material.dart';

class ThemeColors {
  static const Map<int, Color> myColor = {
    50: Color(0xFF90bcf7),
    100: Color(0xFF6fa7f5),
    200: Color(0xFF4e93f3),
    300: Color(0xFF2c7ff1),
    400: Color(0xFF0f6bea),
    500: Color(0xFF0d5cc8),
    600: Color(0xFF0b4ca7),
    700: Color(0xFF083d85),
    800: Color(0xFF062e64),
    900: Color(0xFF041e42),
  };

  final MaterialColor themeColorCustom =
      const MaterialColor(0xFF041e42, myColor);

  static const Color blueWhiteColor = Color(0xfff7f8fc);
  static const Color lightBrown = Color(0xff9F9490);
  static const Color tealColor = Color(0xff108E9B);
  static const Color negativeActionColor = Color.fromRGBO(175, 0, 0, 1);
  static const Color customZincColor = Color.fromARGB(255, 137, 137, 137);
  static const Color customSteelColor = Color.fromARGB(255, 91, 91, 91);
  static const Color customNavyBlueColor = Color.fromARGB(255, 67, 67, 91);
  static const Color customYellowColor = Color.fromARGB(255, 247, 167, 7);
  static const Color customLightGreyColor = Color.fromARGB(255, 235, 236, 236);
  static const Color customGreyColor = Color.fromARGB(255, 197, 198, 198);
  static const Color customDarkGreyColor = Color.fromARGB(255, 157, 158, 158);
}
