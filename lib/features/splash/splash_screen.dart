import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "Splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer(Duration(seconds: 2), (){
      Navigator.pushNamed(context, OnboardingScreen.routeName);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Center(child: ElasticIn(
              duration: Duration(seconds: 1),
              child: Hero(
                  tag: "hero",
                  child: Image.asset(AppAssets.eventlyLogo,width: 309)
              )
          ),
          ),
         const  Spacer(),
          FadeInUp(delay: Duration(seconds: 1),duration: Duration(seconds: 1),child: Image.asset(AppAssets.branding,width: 214)),
          const SizedBox(height: 40,)
        ],
      ),
    );
  }
}
