import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/colors.dart';
import 'iconContainer/icon_container.dart';



class TodoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  const TodoCard({
    Key? key, required this.text, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
          color: accentColor.withOpacity(0.6),
          borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconContainer(icon: icon, color: Colors.white, containerColor: orangeColor,),
          Text(text,
            style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),),
          SizedBox(width: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                padding: EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: darkOrangeColor.withOpacity(0.15),
                ),
                child: Text('30 left',
                  style: TextStyle(
                      color: orangeColor,
                      fontSize: 12
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios,
                color: darkGreyColor,),
            ],
          ),

        ],
      ),

    );
  }
}

