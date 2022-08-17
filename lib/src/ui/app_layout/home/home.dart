import 'package:engagementwallet/recording_sent.dart';
import 'package:engagementwallet/src/ui/app_layout/home/todo_card/iconContainer/icon_container.dart';
import 'package:engagementwallet/src/ui/app_layout/home/todo_card/todo_card.dart';
import 'package:engagementwallet/src/ui/app_layout/home/top_up/top_up.dart';
import 'package:engagementwallet/src/ui/app_layout/home/transfer/make_transfer.dart';
import 'package:engagementwallet/src/ui/app_layout/home/withdraw/withdraw_balance.dart';
import 'package:engagementwallet/src/ui/app_layout/shop/shop.dart';
import 'package:engagementwallet/src/utils/colors.dart';
import 'package:engagementwallet/src/utils/navigationWidget.dart';
import 'package:engagementwallet/src/utils/sized_boxes.dart';
import 'package:engagementwallet/src/widgets/circle_plus.dart';
import 'package:engagementwallet/src/widgets/custom_button.dart';
import 'package:engagementwallet/src/widgets/dialogs/dialogs.dart';
import 'package:engagementwallet/src/widgets/space_divider.dart';
import 'package:engagementwallet/values/assets.dart';
import 'package:engagementwallet/values/padding.dart';
import 'package:engagementwallet/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool change = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar: const TopNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: defaultVHPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(Assets.male),
                            kVerySmallWidth,
                            RichText(
                              text: TextSpan(
                                  text: 'Welcome',
                                  style: textStyle400Small,
                                  children: [
                                    TextSpan(
                                        text: ' Precious', style: textStyle600Small)
                                  ]),
                            )
                          ],
                        ),
                        SvgPicture.asset(Assets.notify)

                      ],
                    ),
                    kSmallHeight,
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                      decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                          Points(),
                          kSmallWidth,
                          Container(color: greyColor, width: 0.6, height: 50,),
                          kSmallWidth,
                          Points(),
                          kSmallWidth,
                          Container(color: greyColor, width: 0.6, height: 50,),
                          kSmallWidth,
                          Points(),
                        ],
                      ),

                    ),
                    SizedBox(height: 20,),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: darkOrangeColor.withOpacity(0.15),
                      ),
                      child: Text('Convert Points',
                      style: TextStyle(
                        color: orangeColor,
                        fontSize: 12
                      ),
                      ),
                    ),

                    SizedBox(height: 40,),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Todo'),
                      ],
                    ),
                    SizedBox(height: 20,),

                    InkWell(
                      onTap: (){
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: accentColor,
                            title: const Center(
                              child: Text('Read out loud',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            content: Wrap(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                  ),
                                  child: Text('UJAH',
                                    style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Time left:', style: TextStyle(color: Colors.black),
                                        ),
                                        TextSpan(
                                          text: ' 03:45', style: TextStyle(color: Colors.red),
                                        ),
                                      ]
                                    ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 100,),
                                Center(
                                  child: Column(
                                    children:  [
                                      Padding(
                                        padding: EdgeInsets.only(left: 15.0, bottom: 10),
                                        child: InkWell(
                                            onTap: (){
                                              showDialog(context: context, builder: (context){
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15),
                                                  ),
                                                  backgroundColor: accentColor,
                                                  title: const Center(
                                                    child: Text('Read out loud',
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 17,
                                                      ),
                                                    ),
                                                  ),
                                                  content: Wrap(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.symmetric(vertical: 20),
                                                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(15),
                                                          color: Colors.white,
                                                        ),
                                                        child: Text('UJAH',
                                                          style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          RichText(text: const TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: 'Time left:', style: TextStyle(color: Colors.black),
                                                                ),
                                                                TextSpan(
                                                                  text: ' 03:45', style: TextStyle(color: Colors.red),
                                                                ),
                                                              ]
                                                          ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 50,),
                                                      Center(
                                                        child: Icon(Icons.multitrack_audio_outlined,
                                                        size: 50,
                                                        color: orangeColor,),
                                                      ),
                                                      SizedBox(height: 70,),
                                                      Center(
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.only(left: 15.0, bottom: 10),
                                                              child: InkWell(
                                                                  onTap: (){
                                                                    showDialog(context: context, builder: (context){
                                                                      return AlertDialog(
                                                                        shape: RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(15),
                                                                        ),
                                                                        backgroundColor: accentColor,
                                                                        title: const Center(
                                                                          child: Text('Read out loud',
                                                                            style: TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 17,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        content: Wrap(
                                                                          children: [
                                                                            Container(
                                                                              margin: EdgeInsets.symmetric(vertical: 20),
                                                                              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(15),
                                                                                color: Colors.white,
                                                                              ),
                                                                              child: Text('UJAH',
                                                                                style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),),
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                RichText(text: const TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: 'Time left:', style: TextStyle(color: Colors.black),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: ' 03:45', style: TextStyle(color: Colors.red),
                                                                                      ),
                                                                                    ]
                                                                                ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            SizedBox(height: 50,),
                                                                            Center(
                                                                              child: Icon(Icons.multitrack_audio_outlined,
                                                                                size: 50,
                                                                                color: orangeColor,),
                                                                            ),
                                                                            SizedBox(height: 100,),

                                                                            Row(
                                                                              children: [
                                                                                Column(
                                                                                  children: [
                                                                                    Icon(Icons.mic,
                                                                                    color: Colors.black,),
                                                                                    SizedBox(height: 5,),
                                                                                    Text('Record again',
                                                                                    style: TextStyle(
                                                                                      color: darkGreyColor,
                                                                                      fontSize: 13,
                                                                                    ),),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(width: 10,),
                                                                                Container(
                                                                                  width: 1,
                                                                                  height: 60,
                                                                                  color: Colors.grey[400],
                                                                                ),
                                                                                SizedBox(width: 40,),
                                                                                Column(
                                                                                  children: [
                                                                                    Icon(Icons.play_circle_fill_rounded,
                                                                                      color: Colors.black,),
                                                                                    SizedBox(height: 5,),
                                                                                    Text('Play',
                                                                                      style: TextStyle(
                                                                                        color: darkGreyColor,
                                                                                        fontSize: 13,
                                                                                      ),),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(width: 40,),
                                                                                Container(
                                                                                  width: 1,
                                                                                  height: 60,
                                                                                  color: Colors.grey[400],
                                                                                ),
                                                                                SizedBox(width: 30,),
                                                                                Column(
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap: (){
                                                                                        Navigator.push(context, MaterialPageRoute(builder: (context) => RecordingSent(),),);
                                                                                      },
                                                                                      child: Icon(Icons.send,
                                                                                        color: orangeColor,),
                                                                                    ),
                                                                                    SizedBox(height: 5,),
                                                                                    Text('Submit',
                                                                                      style: TextStyle(
                                                                                        color: orangeColor,
                                                                                        fontSize: 13,
                                                                                      ),),
                                                                                  ],
                                                                                ),
                                                                                SizedBox(width: 10,),
                                                                              ],
                                                                            )
                                                                          ],
                                                                        ),
                                                                      );
                                                                    });
                                                                  },
                                                                  child: IconContainer(icon: Icons.stop_circle, color: orangeColor, containerColor: Colors.white,)),
                                                            ),
                                                            Text('Click to stop',
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                              ),),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              });
                                            },
                                            child: IconContainer(icon: Icons.mic, color: Colors.white, containerColor: orangeColor,),),
                                      ),
                                      Text('Click to start',
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        });

                      },
                      child:  TodoCard(text: 'Record     ', icon: Icons.mic,),),
                    SizedBox(height: 10,),
                    TodoCard(text: 'Annotate', icon: Icons.mic,),
                    SizedBox(height: 10,),
                    TodoCard(text: 'Translate', icon: Icons.mic,),
                    
                    SizedBox(height: 90,),
                    
                    TextButton(onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Share Your Progress',
                        style: TextStyle(
                          color: orangeColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                        ),
                        SizedBox(width: 5,),
                        Icon(Icons.share_outlined,
                        color: orangeColor,
                        size: 25,)
                      ],
                    ))




                    // CustomButton(
                    //     text: "Convert Points",
                    //     color: accentColor.withOpacity(0.2),
                    //     loader: false,
                    //     onPressed: ()  {
                    //
                    //     }),


                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class Points extends StatelessWidget {
  const Points({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Image.asset(Assets.trophy,),
          kVerySmallHeight,
          Text('61', style: textStyle600Small,),
          kVerySmallHeight,
          Text('Points Scored',style: textStyle600Small.copyWith(color: greyColor,fontSize: 12),),
        ],
      ),
    );
  }
}

























class TopNavBar extends StatelessWidget implements PreferredSizeWidget{
  const TopNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: otherColor,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Image.asset(Assets.kfc),
      ),
      title: Text('KFC Engagement Wallet', style: textStyle400Small),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SvgPicture.asset(Assets.qrCode),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(65);
}

class TransferBox extends StatelessWidget {
  const TransferBox({
    Key? key,
    required this.change,
    required this.onTap,
    required this.amount,
    required this.onTapWithdraw,
    required this.onTapTransfer,
    required this.onTopUp,
  }) : super(key: key);

  final bool change;
  final Function() onTap;
  final Function() onTapWithdraw;
  final Function() onTapTransfer;
  final Function() onTopUp;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          InkWell(
            onTap: onTap,
            child: SvgPicture.asset(change ? Assets.box1 : Assets.box2),
          ),
          Positioned(
            top: 50,
            child: Container(
              width: 378.w,
              decoration: BoxDecoration(
                  color: change ? secondaryColor : darkPrimaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.zero,
                      topRight: Radius.circular(change ? 22 : 0),
                      bottomRight: const Radius.circular(22),
                      bottomLeft: const Radius.circular(22))),
              child: Column(
                children: [
                  Padding(
                    padding: defaultVHPadding,
                    child: Column(
                      children: [
                        InkWell(
                          child: Row(
                            mainAxisAlignment: change
                                ? MainAxisAlignment.spaceBetween
                                : MainAxisAlignment.center,
                            children: [
                              Text(amount, style: textStyleBigWhite),
                              change
                                  ? InkWell(
                                      onTap: onTopUp,
                                      child: const CirclePlus())
                                  : Container()
                            ],
                          ),
                        ),
                        kSmallHeight,
                      ],
                    ),
                  ),
                  SpaceDivider(
                    height: 5,
                    color: whiteColor.withOpacity(0.2),
                  ),
                  Padding(
                    padding: defaultHPadding.copyWith(top: 0),
                    child: Row(
                      mainAxisAlignment: change
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.center,
                      children: [
                        !change
                            ? Container()
                            : GestureDetector(
                                onTap: onTapWithdraw,
                                child: Text('Withdraw balance',
                                    style: textStyleSmallYellow),
                              ),
                        Container(
                          height: 65.h,
                          color: !change ? darkPrimaryColor : Colors.white,
                          width: 0.5,
                        ),
                        GestureDetector(
                          onTap: onTapTransfer,
                          child: Text('Make Transfer',
                              style: textStyleSmallWhite.copyWith(
                                  color:
                                      change ? Colors.white : secondaryColor)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


