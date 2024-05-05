import 'package:andallah/user_Dashbord.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: 
        
            Center(
              child: Lottie.asset(
                  'assets/animation/Animation - 1714861613654.json'),
            )
        ,
       
      nextScreen: const UserDashbord(),
      duration: 4700,
      backgroundColor: Color.fromRGBO(234, 111, 0, 1),
      splashIconSize: 400,
        
        );
  }
}
