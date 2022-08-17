import 'package:engagementwallet/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class LeaderBoardScreen extends StatelessWidget {
  const LeaderBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Leaderboard',
                style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                LeaderBoardCard(text: '1', backGroundcolor: accentColor.withOpacity(0.8), borderColor: orangeColor,),
                LeaderBoardCard(text: '2', backGroundcolor: accentColor.withOpacity(0.8), borderColor: orangeColor,),
                LeaderBoardCard(text: '3', backGroundcolor: accentColor.withOpacity(0.8), borderColor: orangeColor,),
                LeaderBoardCard(text: '4', backGroundcolor: Colors.white, borderColor: Colors.grey,),
                LeaderBoardCard(text: '5', backGroundcolor: Colors.white, borderColor: orangeColor,),
                LeaderBoardCard(text: '6', backGroundcolor: Colors.white, borderColor: Colors.grey,),
                LeaderBoardCard(text: '7', backGroundcolor: Colors.white, borderColor: Colors.grey,),
              ],
            ),
          ),
        ),
    );
  }
}

class LeaderBoardCard extends StatelessWidget {
  final Color backGroundcolor;
  final Color borderColor;
  final String text;
   LeaderBoardCard({
    Key? key, required this.borderColor, required this.text, required this.backGroundcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              color: backGroundcolor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: borderColor,
              ),
            ),
            child: Row(
              children: [
                Text(text),
                SizedBox(width: 15,),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/png/Portrait-Photographers-Nina-Masic.webp'),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Timi Odeyinka',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    )
                    ),
                    SizedBox(height: 3,),
                    Text('Oyo State',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    ),
                  ],
                ),
                SizedBox(width: 60,),
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     Row(
                       children: [
                         RichText(
                             text: TextSpan(
                               children: [
                                 TextSpan(
                                   text: '31276 ',
                                   style: Theme.of(context).textTheme.headline6!.copyWith(color: orangeColor, fontWeight: FontWeight.bold,),
                                 ),
                                 TextSpan(
                                   text: 'recording',
                                   style: TextStyle(
                                     color: orangeColor,
                                     fontSize: 11
                                   ),
                                 ),
                               ]
                             )
                         ),
                       ],
                     ),
                     Row(
                       children: [
                         Image.asset('assets/images/png/trophy.png'),
                         Text('  Master',
                         style: TextStyle(
                           fontSize: 14
                         ),),
                       ],
                     )
                   ],
                 )

              ],
            ),
          ),
        ),
      ],
    );
  }
}
