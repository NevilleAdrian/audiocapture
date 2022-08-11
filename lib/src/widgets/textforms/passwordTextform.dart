import 'package:engagementwallet/src/utils/colors.dart';
import 'package:engagementwallet/src/utils/sized_boxes.dart';
import 'package:engagementwallet/values/fonts.dart';
import 'package:engagementwallet/values/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../values/radii.dart';
typedef String? ValidatorCallback(String? value);
typedef OnChangedCallback(String value);
typedef OnTapCallback();

class PasswordSignUp extends StatefulWidget {
  final TextEditingController? controller;
  final ValidatorCallback? validatorCallback;
  final OnChangedCallback? onChangedCallback;
  final OnTapCallback? onTap;
  final FocusNode? focusNode;
  final EdgeInsets? contentPadding;
  final Color? fillColor;
  final String? errorText;
  final String? labelText;
  final String? hintText;
  final double? hintSize;
  final Color? textColor;
  final FontWeight fontWeight;
  final TextInputType textInputType;
  final FontWeight labelWeight;
  final Color? labelColor;
  final FontStyle labelStyle;
  final Color? hintColor;
  final FontStyle hintStyle;
  final TextAlign textAlign;
  final String? prefixText;
  final FontWeight prefixWeight;
  final List<TextInputFormatter>? inputFormatter;
  final bool enabled;
  final Color? borderColor;
  final Color? focusBorderColor;
  final double borderWidth;
  final double focusBorderWidth;
  final Color? prefixColor;
  final bool useTextIcon;
  final Widget? suffix;
  final Widget? prefix;
  final int maxLines;
  final int? maxLength;
  final bool isInputRequired;
  final Widget? inputRequiredWidget;
  final EdgeInsets? padding;
  final String text;

  const PasswordSignUp(
      {required this.controller,
        required this.validatorCallback,
        this.labelText,
        this.hintText,
        required this.textInputType,
        this.focusNode,
        this.fillColor,
        this.contentPadding = EdgeInsets.zero,
        this.inputFormatter,
        this.enabled = true,
        this.prefixText,
        this.useTextIcon = true,
        this.suffix,
        this.prefix,
        this.errorText,
        this.onChangedCallback,
        this.onTap,
        this.maxLength,
        this.textColor,
        this.padding,
        this.textAlign = TextAlign.start,
        this.fontWeight = kRegularWeight,
        this.labelStyle = FontStyle.normal,
        this.hintStyle = FontStyle.normal,
        this.labelColor = Colors.grey,
        this.labelWeight = kMediumWeight,
        this.hintColor,
        this.maxLines = 1,
        this.hintSize,
        this.prefixColor,
        this.prefixWeight = kRegularWeight,
        this.borderColor,
        this.focusBorderColor,
        this.borderWidth = 0,
        this.focusBorderWidth = 1,
        this.isInputRequired = false,
        this.inputRequiredWidget, required this.text});

  @override
  _PasswordSignUpState createState() => _PasswordSignUpState();
}

class _PasswordSignUpState extends State<PasswordSignUp> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text, style: textStyle400Small),
        kVerySmallHeight,
        Container(
          margin: widget.contentPadding!,
          decoration: BoxDecoration(
              borderRadius: Radii.k10pxRadius,
              color: widget.fillColor ?? lightGreyColor,
              border: Border.all(
                  color: theme.inputDecorationTheme.border!.borderSide.color)),
          child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.textInputType,
              enabled: widget.enabled,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              obscureText: isHidden,
              onTap: widget.onTap,
              style: theme.primaryTextTheme.bodyText2!.copyWith(
                  color: widget.textColor,
                  fontSize: 15,
                  fontWeight: widget.fontWeight),
              validator: widget.validatorCallback,
              inputFormatters: widget.inputFormatter,
              onChanged: widget.onChangedCallback,
              focusNode: widget.focusNode,
              textAlign: widget.textAlign,
              cursorColor: secondaryColor,
              decoration: InputDecoration(
                prefixIcon: widget.prefix != null ? widget.prefix : null,
                suffixIcon: widget.suffix == null
                    ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                  child: widget.useTextIcon
                      ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isHidden ? 'Show' : 'Hide',
                        style: theme.textTheme.bodyText2!
                            .copyWith(color: secondaryColor),
                      ),
                    ],
                  )
                      : Icon(
                    isHidden
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    color: secondaryColor,
                  ),
                )
                    : null,
                prefixText:
                widget.prefixText != null ? '${widget.prefixText} ' : '',
                prefixStyle: theme.textTheme.bodyText2!.copyWith(
                    color: widget.prefixColor ?? theme.textTheme.bodyText2!.color,
                    fontWeight: widget.prefixWeight),
                // errorText: errorText,
                contentPadding: widget.padding ??
                    EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                hintText: widget.hintText,
                hintStyle: theme.primaryTextTheme.bodyText2!.copyWith(
                    color: widget.hintColor ??
                        theme.inputDecorationTheme.hintStyle!.color,
                    fontStyle: widget.hintStyle,
                    fontSize: widget.hintSize),
                labelText: widget.labelText,
                labelStyle: theme.primaryTextTheme.bodyText2!.copyWith(
                    color: widget.labelColor ??
                        theme.inputDecorationTheme.labelStyle!.color,
                    fontStyle: widget.labelStyle,
                    fontWeight: kSemiBoldWeight),
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: Radii.k10pxRadius,
                  borderSide: BorderSide(color: secondaryColor, width: 1.0),
                ),
                border: InputBorder.none,
              )),
        )
      ],
    );
  }
}
