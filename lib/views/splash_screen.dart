import 'package:andallah/views/user_Dashbord.dart';
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
          child: Column(
        children: [
          Center(
              child: Lottie.asset(
                  'assets/animation/Animation - 1717093751887.json')),
          Text('Welcom to Palfix @2024'),
          Text('CopyRights @2024 Nahla I.A.M')
        ],
      ) 
            )
        ,
       
      nextScreen: const UserDashbord(),
      duration: 4700,
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      splashIconSize: 400,
        
        );
  }
}
