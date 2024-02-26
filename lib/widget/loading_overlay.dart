import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    Key? key,
    required this.isLoading,
    required this.child,
    this.isAbsorb = true,
    this.isShowColor,
    this.isShowIndicator = true,
    this.isShowBlurEffect,
  }) : super(key: key);
  final ValueNotifier<bool> isLoading;
  final Widget child;
  final bool isAbsorb;
  final bool? isShowColor;
  final bool? isShowBlurEffect;
  final bool isShowIndicator;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        ValueListenableBuilder<bool>(
          valueListenable: isLoading,
          builder: (context, bool value, _) {
            if (value) {
              return Stack(
                children: [
                  if (isShowBlurEffect != null)
                    BackdropFilter(
                      filter: ui.ImageFilter.blur(
                          sigmaX: 5.0, sigmaY: 5.0), // Adjust blur intensity
                      child: Container(
                        color: Colors
                            .transparent, // You can change the color if needed
                      ),
                    ),
                  AbsorbPointer(
                      absorbing: isAbsorb,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: isShowColor == null
                              ? null
                              : Colors.black.withOpacity(0.2),
                        ),
                        child: SizedBox.expand(
                          child: Center(
                            child: isShowIndicator
                                ? const CircularProgressIndicator()
                                : const SizedBox.shrink(),
                          ),
                        ),
                      )),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
