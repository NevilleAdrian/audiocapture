import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/colors.dart';


class IconContainer extends StatelessWidget {
  const IconContainer({

    Key? key, required this.icon, required this.color, required this.containerColor,

  }) : super(key: key);
  final IconData icon;
  final Color color;
  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: containerColor,
        shape: BoxShape.circle,
      ),
      child: Icon(icon,
        color: color,),
    );
  }
}