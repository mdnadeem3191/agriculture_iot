import 'package:flutter/foundation.dart';

class Debugging {
  static void printing({required String text}) {
    if (kDebugMode) {
      print('Debug: $text');
    }
  }
}