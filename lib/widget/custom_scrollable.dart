import 'package:flutter/material.dart';

class CustomScrollAble extends StatefulWidget {
  const CustomScrollAble({
    super.key,
    required this.child,
    this.edgeInsets,
  });
  final EdgeInsets? edgeInsets;
  final Widget child;

  @override
  State<CustomScrollAble> createState() => _CustomScrollAbleState();
}

class _CustomScrollAbleState extends State<CustomScrollAble> {
  final ScrollController _horizontalScrollController = ScrollController();
  final ScrollController _verticalScrollController = ScrollController();

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    _verticalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.edgeInsets ??
          const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: CustomRawScrollable(
        scrollController: _verticalScrollController,
        axis: Axis.vertical,
        scrollbarOrientation: ScrollbarOrientation.right,
        child: Center(
          child: CustomRawScrollable(
            scrollController: _horizontalScrollController,
            axis: Axis.horizontal,
            scrollbarOrientation: ScrollbarOrientation.bottom,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class CustomRawScrollable extends StatelessWidget {
  const CustomRawScrollable({
    super.key,
    required this.child,
    required this.scrollController,
    required this.axis,
    required this.scrollbarOrientation,
  });
  final ScrollbarOrientation scrollbarOrientation;
  final Axis axis;
  final Widget child;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbVisibility: true,
      interactive: true,
      radius: const Radius.circular(20),
      thumbColor: const Color.fromARGB(255, 199, 201, 201),
      scrollbarOrientation: scrollbarOrientation,
      controller: scrollController,
      thickness: 12,
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: axis,
        child: child,
      ),
    );
  }
}
