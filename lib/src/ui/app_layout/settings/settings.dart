import 'package:engagementwallet/src/ui/app_layout/app_layout.dart';
import 'package:engagementwallet/src/utils/colors.dart';
import 'package:engagementwallet/src/widgets/forms/registration_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal:15,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Settings',
                  style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold,),),
                  Text('Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              InkWell(
                onTap: (){},
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: accentColor.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundImage: AssetImage('assets/images/png/profile.png'),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Precious Maverick',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                                SizedBox(height: 3,),
                                Text('Profile Settings',
                                style: TextStyle(
                                  fontSize: 12
                                ),),
                              ],
                            ),
                            SizedBox(width: 145,),
                            Icon(Icons.arrow_forward_ios,
                            color: darkGreyColor,),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  TextButton(onPressed: (){}, child:
                  Row(
                    children: [
                      Text('Security Settigs',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      ),
                      SizedBox(width: 225,),
                      Icon(Icons.arrow_forward_ios,
                        color: darkGreyColor,),
                    ],
                  ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10,),
                      height: 1,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  TextButton(onPressed: (){
                    showDialog(context: context, builder: (context) => AlertDialog(
                      content: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                SizedBox(width: 15,),
                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.cancel_rounded,
                                  color: Colors.grey[300],),
                                ),
                                SizedBox(width: 50,),
                                Text('Progress Tier Rules',
                                style: TextStyle
                                  (fontWeight: FontWeight.bold),),
                                SizedBox(height: 55,),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    // margin: EdgeInsets.symmetric(horizontal: 10,),
                                    height: 1,

                                    decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: 15,),
                            //  Center(
                            //   child: Text('Beginner',
                            // style: TextStyle(
                            //   fontWeight: FontWeight.bold,
                            // ),
                            // ),
                            // ),
                            // SizedBox(height: 10,),

                            AwardScrollBox(
                              levelText: 'Beginner',
                              containerText: '0 recordings required, 2 points per recordings',),
                            SizedBox(height: 15,),
                            AwardScrollBox(
                              levelText: 'Novice',
                              containerText: '20 recordings required, 5 points per recordings',),
                            SizedBox(height: 15,),
                            AwardScrollBox(
                              levelText: 'Amateur',
                              containerText: '50 recordings required, 8 points per recordings',),
                            SizedBox(height: 15,),
                            AwardScrollBox(
                              levelText: 'Proficient',
                              containerText: '100 recordings required, 12 points per recordings',),
                            SizedBox(height: 15,),
                            AwardScrollBox(
                              levelText: 'Professional',
                              containerText: '200 recordings required, 20 points per recordings',),
                            SizedBox(height: 15,),
                            AwardScrollBox(
                              levelText: 'Expert',
                              containerText: '500 recordings required, 30 points per recordings',),
                            SizedBox(height: 15,),
                            AwardScrollBox(
                              levelText: 'Master',
                              containerText: '1000 recordings required, 50 points per recordings',),
                            SizedBox(height: 15,),
                            AwardScrollBox(
                              levelText: 'Grand Master',
                              containerText: '2000 recordings required, 150 points per recordings',),



                          ],
                        ),
                      ),
                    ));
                  }, child:
                  Row(
                    children: [
                      Text('Progress Tier Rules',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 203,),
                      Icon(Icons.arrow_forward_ios,
                        color: darkGreyColor,),
                    ],
                  ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10,),
                      height: 1,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text('Alerts & Notification',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 7,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Text('Use fingerprint or face ID to login and \n perform transactions',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),),
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

class AwardScrollBox extends StatelessWidget {

  final String containerText;
  final String levelText;
  const AwardScrollBox({
    Key? key, required this.containerText, required this.levelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/png/medal.png'),
            Text(levelText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: accentColor.withOpacity(0.6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(containerText,
                    style: TextStyle(
                      fontSize: 11,
                    ),
                    ),
                  ],
                ),
                padding: EdgeInsets.only(left: 20, right: 20,),
                margin: EdgeInsets.symmetric(horizontal: 15,),
                height: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}


