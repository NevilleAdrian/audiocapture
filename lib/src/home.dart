import 'package:engagementwallet/src/logic/mixin/app_mixins/app_mixin.dart';
import 'package:engagementwallet/src/ui/authentication/login/login.dart';
import 'package:engagementwallet/src/ui/splash/splashscreen.dart';
import 'package:engagementwallet/src/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AudioCaptureHome extends StatefulWidget {
  const AudioCaptureHome({Key? key}) : super(key: key);

  @override
  State<AudioCaptureHome> createState() => _AudioCaptureHomeState();
}

class _AudioCaptureHomeState extends State<AudioCaptureHome> {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: appProviders,
      child: ScreenUtilInit(
        designSize: Size(414, 896),
        builder: () => MaterialApp(
          title: 'Audio Capture',
          theme: myThemeData(context),
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}


