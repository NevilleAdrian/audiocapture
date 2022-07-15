/*
*  After7
*
*  Created by [Folarin Opeyemi].
*  Copyright © 2021 [Intelligent Innovation Limited]. All rights reserved.
    */

import 'package:engagementwallet/src/utils/colors.dart';
import 'package:engagementwallet/values/fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../values/radii.dart';

typedef String? ValidatorCallback(String? value);
typedef OnChangedCallback(String value);
typedef OnTapCallback();

class EditTextSignUp extends StatefulWidget {
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
  final TextAlignVertical? textAlignVertical;
  final String? prefixText;
  final FontWeight prefixWeight;
  final List<TextInputFormatter>? inputFormatter;
  final bool enabled;
  final bool useDefaultSuffix;
  final Color? borderColor;
  final Color? focusBorderColor;
  final double borderWidth;
  final double focusBorderWidth;
  final Color? prefixColor;
  final Widget? suffix;
  final Widget? prefix;
  final int maxLines;
  final int? maxLength;
  final bool isInputRequired;
  final Widget? inputRequiredWidget;
  final EdgeInsets? padding;

  const EditTextSignUp(
      {required this.controller,
        this.validatorCallback,
        this.labelText,
        this.hintText,
        required this.textInputType,
        this.focusNode,
        this.fillColor,
        this.contentPadding = EdgeInsets.zero,
        this.inputFormatter,
        this.enabled = true,
        this.prefixText,
        this.suffix,
        this.prefix,
        this.errorText,
        this.onChangedCallback,
        this.onTap,
        this.maxLength,
        this.textColor,
        this.padding,
        this.useDefaultSuffix = false,
        this.textAlign = TextAlign.start,
        this.textAlignVertical,
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
        this.inputRequiredWidget,});

  @override
  _EditTextSignUpState createState() => _EditTextSignUpState();
}

class _EditTextSignUpState extends State<EditTextSignUp> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: widget.contentPadding!,
      decoration: BoxDecoration(
          borderRadius: Radii.k10pxRadius,
          color: widget.fillColor ??lightGreyColor,
          border: Border.all(
              width: 0.5,
              color: theme.inputDecorationTheme.border!.borderSide.color)),
      child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.textInputType,
          enabled: widget.enabled,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
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
          textAlignVertical: widget.textAlignVertical,
          cursorColor: secondaryColor,
          decoration: InputDecoration(
            prefixIcon: widget.prefix != null ? widget.prefix : null,
            suffixIcon: widget.useDefaultSuffix
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_outline, color: secondaryColor,),
              ],
            )
                : widget.suffix != null
                ? widget.suffix
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
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
          )),
    );
  }
}


/*
*  After7
*
*  Created by [Folarin Opeyemi].
*  Copyright © 2021 [Intelligent Innovation Limited]. All rights reserved.
    */

import 'package:afterseven/src/values/values.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final String prefixFamily;
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
        this.labelColor = AppColors.hintTextColor,
        this.labelWeight = kMediumWeight,
        this.hintColor,
        this.maxLines = 1,
        this.hintSize,
        this.prefixColor,
        this.prefixFamily = kNairaFontFamily,
        this.prefixWeight = kRegularWeight,
        this.borderColor,
        this.focusBorderColor,
        this.borderWidth = 0,
        this.focusBorderWidth = 1,
        this.isInputRequired = false,
        this.inputRequiredWidget});

  @override
  _PasswordSignUpState createState() => _PasswordSignUpState();
}

class _PasswordSignUpState extends State<PasswordSignUp> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: widget.contentPadding!,
      decoration: BoxDecoration(
          borderRadius: Radii.k10pxRadius,
          color: widget.fillColor ?? AppColors.secondaryColor,
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
                        .copyWith(color: AppColors.labelTextColor),
                  ),
                ],
              )
                  : Icon(
                isHidden
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                color: AppColors.labelTextColor,
              ),
            )
                : null,
            prefixText:
            widget.prefixText != null ? '${widget.prefixText} ' : '',
            prefixStyle: theme.textTheme.bodyText2!.copyWith(
                color: widget.prefixColor ?? theme.textTheme.bodyText2!.color,
                fontFamily: widget.prefixFamily,
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
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
          )),
    );
  }
}
