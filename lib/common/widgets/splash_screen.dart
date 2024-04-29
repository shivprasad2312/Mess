import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mess/features/home/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.asset("images/lottie/Animation - 1712088907976.json"),
          )
        ],
      ), 
      nextScreen: const HomeScreen(),
      splashIconSize: 400,
      backgroundColor: const Color.fromARGB(255, 107, 159, 248),
    );
      
  }
}