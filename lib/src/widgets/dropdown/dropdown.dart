import 'package:engagementwallet/src/utils/colors.dart';
import 'package:engagementwallet/src/utils/sized_boxes.dart';
import 'package:engagementwallet/values/text_styles.dart';
import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  DropDown({this.onTap, this.text});
  Function()? onTap;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text ?? '', style: textStyle400Small),
        kVerySmallHeight,
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: greyColor,
                  width: 0.3,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: secondaryColor, width: 1.0),
              ),
              focusColor: primaryColor,
              suffixIcon: Icon(Icons.keyboard_arrow_down),
              fillColor: lightGreyColor,
              filled: true,
              contentPadding:
              EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
              hintText: text,
              // labelText: label,
              labelStyle: TextStyle(color: Colors.grey),
              hintStyle: TextStyle(
                color: greyColor,
                fontFamily: "Montserrat",
              )),
          onTap: onTap,
        ),
      ],
    );
  }
}