import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';
import 'package:quizapp/screens/quizscreen.dart';
import 'package:quizapp/screens/welcomscreen.dart';

import '../models/auth_model.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Authen authen=Authen();
    bool d=authen.valid();
    return AnimatedSplashScreen(
      nextScreen: d==true?const QuisScreen():const WelcomeScreen(),
      backgroundColor: Colors.blueGrey,
      splashIconSize: 250,
      duration: 4000,
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.bottomToTop,
      animationDuration: const Duration(seconds: 2),
      splash: Column(
        children: [
          Expanded(child: Image.asset('assets/1.png')),
          const Text(
            'Let`s go',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
