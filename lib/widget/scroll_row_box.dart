import 'package:agriculture_web/Utils/utils.dart';
import 'package:agriculture_web/constant/constant_screen.dart';
import 'package:agriculture_web/theme/theme_colors.dart';
import 'package:agriculture_web/widget/debugging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WebScrollRowBox extends StatelessWidget {
  const WebScrollRowBox({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    double osset = 250;
    double scrollOffset = 250;
    return (defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS)
        ? const SizedBox.shrink()
        : SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FractionalTranslation(
                  translation: const Offset(0.2, 0.0),
                  child: _ScrollDecoratedBox(
                    scrollController: scrollController,
                    onTap: () {
                      Debugging.printing(
                          text:
                              "  scrollController.offset ${scrollController.offset}");
                      if (scrollController.offset != 0) {
                        osset -= scrollController.offset < scrollOffset
                            ? scrollController.offset
                            : scrollOffset;
                        scrollController.animateTo(
                          osset,
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastOutSlowIn,
                        );
                      }
                    },
                    iconData: Icons.chevron_left,
                  ),
                ),
                FractionalTranslation(
                  translation: const Offset(-0.2, 0.0),
                  child: _ScrollDecoratedBox(
                    scrollController: scrollController,
                    onTap: () {
                      osset += scrollOffset;
                      scrollController.animateTo(
                        osset,
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                    iconData: Icons.chevron_right,
                  ),
                ),
              ],
            ),
          );
  }
}

class _ScrollDecoratedBox extends StatefulWidget {
  const _ScrollDecoratedBox({
    required this.iconData,
    required this.onTap,
    required this.scrollController,
  });
  final IconData iconData;
  final VoidCallback onTap;
  final ScrollController scrollController;

  @override
  State<_ScrollDecoratedBox> createState() => _ScrollDecoratedBoxState();
}

class _ScrollDecoratedBoxState extends State<_ScrollDecoratedBox> {
  bool isScrollable = false;
  double screenSize = 0;
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    screenSize = Utils.screenWidth(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.scrollController.position.maxScrollExtent > 0) {
        isScrollable = true;
        setState(() {});
      } else {
        isScrollable = false;
        if (!mounted) return;
        setState(() {});
      }
    });
    return isScrollable == false
        ? const SizedBox.shrink()
        : GestureDetector(
            onTap: widget.onTap,
            child: SizedBox(
              width: screenSize < kLargeTabBreakPoint ? 32 : 40,
              height: screenSize < kLargeTabBreakPoint ? 75 : 90,
              child: MouseRegion(
                onEnter: (event) {
                  _isHover = !_isHover;
                  setState(() {});
                },
                onExit: (event) {
                  _isHover = !_isHover;
                  setState(() {});
                },
                child: Card(
                  elevation: 5,
                  margin: EdgeInsets.zero,
                  color: _isHover
                      ? ThemeColors.customLightGreyColor
                      : Colors.white,
                  child: Center(
                    child: Icon(
                      widget.iconData,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
