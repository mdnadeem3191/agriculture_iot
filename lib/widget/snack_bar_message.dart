import 'package:flutter/material.dart';

abstract class SnackBarMessage {
  static const _snackBarDur = Duration(seconds: 3);

  /// Pass the error text to show in SnackBar
  static void show({
    required String errorText,
    IconData errorIcon = Icons.error_outline_sharp,
    required BuildContext context,
    Duration? duration,
    bool toShowDismiss = true,
    double widthRatio = 0.7,
  }) {
    final snackBar = SnackBar(
      dismissDirection: DismissDirection.down,
      duration: duration ?? _snackBarDur,
      content: Row(
        children: [
          Icon(
            errorIcon,
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
          Expanded(
            child: Text(
              errorText,
              style: const TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
      action: toShowDismiss
          ? SnackBarAction(
              label: 'Dismiss',
              onPressed: () {
                // ScaffoldMessenger.of(context)..removeCurrentSnackBar();
              },
            )
          : null,
      shape: const StadiumBorder(),
      // width: MediaQuery.of(context).size.width * widthRatio,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
