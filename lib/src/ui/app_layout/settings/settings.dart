import 'package:engagementwallet/src/utils/colors.dart';
import 'package:engagementwallet/src/widgets/forms/registration_form.dart';
import 'package:flutter/material.dart';


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
                  TextButton(onPressed: (){}, child:
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


