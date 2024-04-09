import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/ui/constants.dart';
import 'package:plant_app/ui/screens/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:  Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       CircleAvatar(
                          backgroundColor:Colors.white,
                          radius: 110,
                          child: Image.asset('assets/icon/leaves.png'),
                        ),
                        const Text(
                        "Plantify",
                        style:TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 40
                        ),
                      ),
                    ],
                  ),
          ),
              ),
          
      ),
      backgroundColor:Constants.primaryColor,
      nextScreen: const OnboardingScreen(),
      splashIconSize: 250,
      duration: 4000,
      splashTransition: SplashTransition.sizeTransition,
    );
  }
}