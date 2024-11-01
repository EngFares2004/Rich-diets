import 'dart:async';

import 'package:flutter/material.dart';

import '../configuration/app_routes.dart';
import '../configuration/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
    // to animate the logo
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (width == 130) {
          setState(() {
            width = 150;
            height = 180;
          });
        } else {
          setState(() {
            width = 130;
            height = 154;
          });
        }
      },
    );
    super.initState();
  }

  double width = 130;
  double height = 154;
  late Timer timer;
  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Center(
          child: AnimatedContainer(
            width: width,
            height: height,
            duration: const Duration(seconds: 1),
            child: Image.asset(
              'assets/images/Frame.png',
            ),
          ),
        ),
        const Positioned(
          right: 0,
          left: 0,
          bottom: 85,
          child: Center(
            child: Text(
              "Rich-diets 2023",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppTheme.primaryColor,
              ),
            ),
          ),
        ),
      ],
    ));
  }


}
