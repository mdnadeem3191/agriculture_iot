import 'package:agriculture_web/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    Key? key,
    this.hintText,
    this.readOnly = false,
    this.enabled = true,
    this.initialValue,
    this.label,
    this.onValidation,
    this.controller,
    this.textInputType,
    this.prefixText,
    this.autoFocus = false,
    this.maxLines,
    this.focusNode,
    this.cursorScrollController,
    this.inputFormatters,
    this.suffixIcon,
    this.suffixText,
    this.onChanged,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.contentPadding,
    this.maxLength,
    this.onEditingComplete,
    this.inputDecoration,
  }) : super(key: key);

  final String? hintText;
  final String? label;
  final bool? enabled;
  final String? initialValue;
  final bool readOnly;
  final String? Function(String?)? onValidation;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? prefixText;
  final String? suffixText;
  final Widget? suffixIcon;
  final bool autoFocus;
  final int? maxLines;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final ScrollController? cursorScrollController;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final bool obscureText;
  final Function()? onEditingComplete;
  final InputDecoration? inputDecoration;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: onEditingComplete,
      obscureText: obscureText,
      maxLength: maxLength,
      maxLines: maxLines,
      controller: controller,
      enabled: enabled,
      initialValue: initialValue,
      readOnly: readOnly,
      keyboardType: textInputType,
      autofocus: autoFocus,
      focusNode: focusNode,
      scrollController: cursorScrollController,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      decoration: inputDecoration ??
          InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: ThemeColors.myColor[800]!,
                width: 1.5,
              ),
            ),
            contentPadding: contentPadding,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black12),
            ),
            label: label == null ? null : Text(label!),
            hintText: hintText,
            prefixText: prefixText,
            suffixText: suffixText,
            suffixIcon: suffixIcon,
            isDense: true,
          ),
      validator: (String? validatedValue) {
        if (onValidation != null) {
          return onValidation!(validatedValue);
        }
        return null;
      },
      onChanged: (String value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
    );
  }
}

class CustomLabelTextField extends StatelessWidget {
  const CustomLabelTextField({
    super.key,
    this.hintText,
    this.readOnly = false,
    this.enabled = true,
    this.initialValue,
    this.label,
    this.onValidation,
    this.controller,
    this.textInputType,
    this.prefixText,
    this.autofocus = false,
    this.maxLines,
    this.focusNode,
    this.cursorScrollController,
    this.inputFormatters,
    this.suffixIcon,
    this.suffixText,
    this.onChanged,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.contentPadding,
    this.maxLength,
    this.onEditingComplete,
    this.outlineInputBorder,
  });
  final String? hintText;
  final String? label;
  final bool? enabled;
  final String? initialValue;
  final bool readOnly;
  final String? Function(String?)? onValidation;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? prefixText;
  final String? suffixText;
  final Widget? suffixIcon;
  final bool autofocus;
  final int? maxLines;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final ScrollController? cursorScrollController;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final bool obscureText;
  final Function()? onEditingComplete;
  final InputBorder? outlineInputBorder;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextfieldTitle(title: label ?? ""),
          const SizedBox(
            height: 3,
          ),
          TextFieldCustom(
            onEditingComplete: onEditingComplete,
            obscureText: obscureText,
            maxLength: maxLength,
            maxLines: maxLines,
            controller: controller,
            enabled: enabled,
            suffixText: suffixText,
            initialValue: initialValue,
            readOnly: readOnly,
            textInputType: textInputType,
            autoFocus: autofocus,
            suffixIcon: suffixIcon,
            focusNode: focusNode,
            cursorScrollController: cursorScrollController,
            inputFormatters: inputFormatters,
            textCapitalization: textCapitalization,
            onValidation: (String? validatedValue) {
              if (onValidation != null) {
                return onValidation!(validatedValue);
              }
              return null;
            },
            onChanged: (String value) {
              if (onChanged != null) {
                onChanged!(value);
              }
            },
          ),
        ],
      ),
    );
  }
}

class TextfieldTitle extends StatelessWidget {
  const TextfieldTitle({
    super.key,
    required this.title,
    this.textStyle,
  });
  final TextStyle? textStyle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: textStyle ??
            TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.7),
            ),
      ),
    );
  }
}

class DecoTextFelidCustom extends StatelessWidget {
  const DecoTextFelidCustom(
      {super.key,
      this.hintText,
      this.label,
      this.enabled,
      this.initialValue,
      this.readOnly,
      this.onValidation,
      this.controller,
      this.textInputType,
      this.prefixText,
      this.suffixText,
      this.suffixIcon,
      this.autoFocus,
      this.maxLines,
      this.focusNode,
      this.textCapitalization,
      this.cursorScrollController,
      this.inputFormatters,
      this.onChanged,
      this.contentPadding,
      this.maxLength,
      this.obscureText,
      this.onEditingComplete,
      this.inputDecoration,
      this.prefix,
      this.preChild});
  final String? hintText;
  final String? label;
  final bool? enabled;
  final String? initialValue;
  final bool? readOnly;
  final String? Function(String?)? onValidation;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? prefixText;
  final String? suffixText;
  final Widget? suffixIcon;
  final bool? autoFocus;
  final int? maxLines;
  final FocusNode? focusNode;
  final TextCapitalization? textCapitalization;
  final ScrollController? cursorScrollController;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final bool? obscureText;
  final Function()? onEditingComplete;
  final InputDecoration? inputDecoration;
  final Widget? prefix;
  final Widget? preChild;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ThemeColors.myColor[800]!.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 0.5),
          ),
        ],
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Row(
        children: [
          if (preChild != null)
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: preChild!,
            ),
          Expanded(
            child: TextFieldCustom(
              autoFocus: autoFocus ?? false,
              controller: controller,
              cursorScrollController: cursorScrollController,
              enabled: enabled,
              focusNode: focusNode,
              hintText: hintText,
              initialValue: initialValue,
              inputFormatters: inputFormatters,
              label: label,
              maxLength: maxLength,
              maxLines: maxLines,
              obscureText: obscureText ?? false,
              onEditingComplete: onEditingComplete,
              textInputType: textInputType,
              onChanged: onChanged,
              onValidation: onValidation,
              prefixText: prefixText,
              readOnly: readOnly ?? false,
              suffixIcon: suffixIcon,
              suffixText: suffixText,
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              contentPadding: contentPadding,
              inputDecoration: InputDecoration(
                suffixIcon: suffixIcon,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 15,
                ),
                hintText: hintText,
                prefix: prefix,
                hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AlertText extends StatelessWidget {
  const AlertText({
    super.key,
    required ValueNotifier<String?> emailNotifier,
  }) : _emailNotifier = emailNotifier;

  final ValueNotifier<String?> _emailNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _emailNotifier,
      builder: (context, value, child) => _emailNotifier.value == null
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _emailNotifier.value!,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: ThemeColors.myColor[800],
                  ),
                ),
              ),
            ),
    );
  }
}
