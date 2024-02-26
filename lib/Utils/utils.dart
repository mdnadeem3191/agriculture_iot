import 'package:flutter/material.dart';

class Utils {
  static Size screenDimensions(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }

  static double screenWidth(BuildContext context) {
    return screenDimensions(context).width;
  }

  static double screenHeight(BuildContext context) {
    return screenDimensions(context).height;
  }
}
