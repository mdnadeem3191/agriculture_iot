import 'package:agriculture_web/theme/theme_colors.dart';
import 'package:agriculture_web/widget/navigate_route.dart';
import 'package:agriculture_web/widget/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class AlertListTile extends StatefulWidget {
  const AlertListTile({
    super.key,
    this.text,
    this.text2,
    required this.hintText,
    this.hintText2,
    this.inputLength,
    required this.textInputType,
    this.suffixText,
    this.onValidation,
    this.isBattery = false,
    this.alertText,
  });

  final String? alertText;
  final bool isBattery;
  final String? text;
  final String? text2;
  final String hintText;
  final String? hintText2;
  final String? suffixText;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputLength;
  final String? Function(String?)? onValidation;
  @override
  State<AlertListTile> createState() => _AlertListTileState();
}

class _AlertListTileState extends State<AlertListTile> {
  TextEditingController _textEditController = TextEditingController();
  TextEditingController _textEditController2 = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _fromKey.currentState?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _textEditController = TextEditingController(text: widget.text ?? "");
    _textEditController2 = TextEditingController(text: widget.text2 ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Form(
        key: _fromKey,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ui.ImageFilter.blur(
                  sigmaX: 5.0, sigmaY: 5.0), // Adjust blur intensity
              child: Container(
                color: Colors.transparent, // You can change the color if needed
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                ),
                child: const SizedBox.expand(),
              ),
            ),
            Center(
              child: SizedBox(
                height: widget.alertText == null ? 200 : 250,
                width: 325,
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 18,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              if (widget.alertText != null)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 25, top: 5),
                                  child: Text(widget.alertText!),
                                ),
                              TextFieldCustom(
                                  suffixText: widget.suffixText,
                                  controller: _textEditController,
                                  label: widget.hintText,
                                  textInputType: widget.textInputType,
                                  inputFormatters: widget.inputLength,
                                  maxLines: 1,
                                  onValidation: widget.onValidation),
                              widget.hintText2 != null
                                  ? Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: TextFieldCustom(
                                        suffixText: widget.suffixText,
                                        controller: _textEditController2,
                                        label: widget.hintText2,
                                        textInputType: widget.textInputType,
                                        inputFormatters: widget.inputLength,
                                        maxLines: 1,
                                        onValidation: widget.onValidation,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          ),
                        ),
                        widget.hintText2 != null
                            ? _AlertButtonRow(
                                onTap: () {
                                  Navigator.pop(
                                      context,
                                      SsidPassword(
                                          ssid: _textEditController.text,
                                          password: _textEditController2.text));
                                },
                              )
                            : _AlertButtonRow(
                                onTap: () {
                                  if (_fromKey.currentState != null) {
                                    if (_fromKey.currentState!.validate()) {
                                      try {
                                        double a = double.parse(
                                            _textEditController.value.text);
                                        Navigator.of(context).pop(a);
                                      } catch (_) {
                                        Navigator.of(context).pop(
                                            _textEditController.value.text);
                                      }
                                    }
                                  }
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AlertButtonRow extends StatelessWidget {
  const _AlertButtonRow({required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _AlertButton(
          isTrue: false,
          onTap: () {
            Navigator.of(context).pop(false);
          },
        ),
        _AlertButton(
          isTrue: true,
          onTap: onTap,
        ),
      ],
    );
  }
}

class _AlertButton extends StatelessWidget {
  const _AlertButton({
    required this.isTrue,
    this.toShowOkButton,
    required this.onTap,
  });
  final bool isTrue;
  final bool? toShowOkButton;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isTrue
              ? ThemeColors.myColor[800]
              : ThemeColors.myColor[800]!.withOpacity(0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: SizedBox(
            width: 135,
            height: 26,
            child: Center(
              child: Text(
                (toShowOkButton != null && toShowOkButton == true)
                    ? "Ok"
                    : isTrue
                        ? "Yes"
                        : "No",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: isTrue ? Colors.white : ThemeColors.myColor[800],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAlert extends StatelessWidget {
  const CustomAlert({
    super.key,
    this.alertHeading,
    this.alertMessage,
    required this.height,
    required this.width,
    this.toShowOkButton = false,
  });
  final String? alertHeading;
  final Widget? alertMessage;
  final double height;
  final double width;
  final bool toShowOkButton;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ui.ImageFilter.blur(
              sigmaX: 5.0, sigmaY: 5.0), // Adjust blur intensity
          child: Container(
            color: Colors.transparent, // You can change the color if needed
          ),
        ),
        GestureDetector(
          onTap: () {
            toShowOkButton
                ? NavigatePageRoute().navigatePopSend(
                    context: context,
                    argument: true,
                  )
                : null;
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
            child: const SizedBox.expand(),
          ),
        ),
        Center(
          child: SizedBox(
            width: width,
            height: height,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    alertHeading == null
                        ? const SizedBox.shrink()
                        : Text(
                            alertHeading ?? "",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    alertHeading == null
                        ? const SizedBox.shrink()
                        : const SizedBox(
                            height: 10,
                          ),
                    alertMessage ?? const SizedBox.shrink(),
                    const Spacer(),
                    toShowOkButton
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: _AlertButton(
                              onTap: () async {
                                await NavigatePageRoute().navigatePopSend(
                                    context: context, argument: false);
                              },
                              toShowOkButton: toShowOkButton,
                              isTrue: true,
                            ),
                          )
                        : _AlertButtonRow(
                            onTap: () async {
                              await NavigatePageRoute().navigatePopSend(
                                  context: context, argument: true);
                            },
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SsidPassword {
  final String? ssid;
  final String? password;
  SsidPassword({
    this.ssid,
    this.password,
  });
}

abstract class AlertPopUpFunction {
  static Future<void> alertPopUp(
    String title,
    String subTitle,
    BuildContext context,
    double? height,
    double? width,
  ) async {
    await NavigatePageRoute().navigatePushPageRouteBuilder(
      context: context,
      widget: CustomAlert(
        alertHeading: title,
        toShowOkButton: true,
        alertMessage: Text(
          subTitle,
          style: const TextStyle(fontSize: 15),
        ),
        height: height ?? 190,
        width: width ?? 325,
      ),
    );
  }
}
