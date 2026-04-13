

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marketplace/feature/auth/presentation/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), (){
      if(mounted){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (cotext) => Onboarding()),
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {

          },
          child: Text('Splash'),
        ),
      ),
    );
  }
}
