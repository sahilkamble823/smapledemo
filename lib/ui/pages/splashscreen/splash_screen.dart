import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:sahil_ps_demo/ui/pages/homepage/home_page.dart';
import 'package:sahil_ps_demo/ui/pages/introscreen/intro_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

   final colorizeTextStyle = TextStyle(
    fontSize: 18,
    fontFamily: 'Horizon',
  );

   void loadingData()async{
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     bool isLogin = sharedPreferences.getBool('islogin') ?? false;
     if(isLogin){
       Timer(Duration(seconds: 3), () {
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
       });
     }
     else{
       Timer(Duration(seconds: 3), () {
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>IntroScreen()));
       });
     }

   }
   @override
  void initState() {
    // TODO: implement initState
     loadingData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('PEOPLESCOPE', style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 40,),
              AnimatedTextKit(
                    animatedTexts: [
                   ColorizeAnimatedText(
                       'Enabling Work , Supporting Growth',
                       textStyle: colorizeTextStyle,
                       colors: colorizeColors,
                   ),
                  ],
                  isRepeatingAnimation: true,
                ),
              SizedBox(height: 50,),
              Container(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: Colors.blue,
                  strokeWidth: 2,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
