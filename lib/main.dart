import 'package:flutter/material.dart';
import 'package:sahil_ps_demo/ui/pages/homepage/home_page.dart';
import 'package:sahil_ps_demo/ui/pages/introscreen/intro_screen.dart';
import 'package:sahil_ps_demo/ui/pages/login/forgot_password.dart';
import 'package:sahil_ps_demo/ui/pages/login/login_page.dart';
import 'package:sahil_ps_demo/ui/pages/login/signup_page.dart';

import 'package:sahil_ps_demo/ui/pages/splashscreen/splash_screen.dart';
import 'package:sahil_ps_demo/ui/pages/wallpost/wall_post.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PeopleScope',
      theme: ThemeData(
        primarySwatch:  Colors.yellow,
      ),
      home: SplashScreen(),
    );
  }
}
