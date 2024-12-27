import 'dart:async';

import 'package:contact_app/res/assets/image/assets_image.dart';
import 'package:contact_app/view/onBoading_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void isLogin() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnboadingScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 70),
          Center(
              child: Text(
            'Well come back',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
          SizedBox(height: 10),
          Expanded(
            child: Image.asset(
              AssetsImage.logo,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
