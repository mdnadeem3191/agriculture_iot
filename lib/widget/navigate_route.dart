import 'package:flutter/material.dart';

class NavigatePageRoute {
  Future<dynamic> navigatePush(
      {required BuildContext context, required Widget widget}) async {
    return await Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => widget));
  }

  Future<dynamic> navigatePushReplacement(
      {required BuildContext context, required Widget widget}) async {
    return await Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => widget));
  }

  Future<dynamic> navigatePushPageRouteBuilder(
      {required BuildContext context, required Widget widget}) async {
    return await Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false, pageBuilder: (context, __, _) => widget));
  }

  Future<dynamic> navigatePushPageRouteBuilderAnimation(
      {required BuildContext context, required Widget widget}) async {
    return await Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          Animation<Offset> offsetAnimation = Tween<Offset>(
                  begin: const Offset(1.1, 0), end: const Offset(0, 0))
              .animate(animation);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        pageBuilder: (context, __, _) => widget,
      ),
    );
  }

  Future<void> navigatePushAndRemoveUntil(
      {required BuildContext context, required Widget widget}) async {
    await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => widget),
        (Route<dynamic> route) => false);
  }

  void navigatePop({required BuildContext context}) async {
    return Navigator.of(context).pop();
  }

  Future<void> navigatePopSend(
      {required BuildContext context, required var argument}) async {
    return Navigator.of(context).pop(argument);
  }
}
