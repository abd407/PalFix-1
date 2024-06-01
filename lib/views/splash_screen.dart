import 'package:palfix/views/user_Dashbord.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Stack(
        children: [
          Lottie.asset('assets/animation/Animation - 1717093751887.json'),
          const Positioned(
            bottom: 25,
            left: 0,
            right: 0,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('Welcom to Palfix @2024',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal))),
          ),
          const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'CopyRights @2024 Nahla I.A.M',
                  style: TextStyle(
                      fontSize: 6,
                      fontWeight: FontWeight.w100,
                      color: Colors.teal),
                ),
              ))
              
        ],
      ),
      nextScreen: const UserDashbord(),
      duration: 4700,
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      splashIconSize: 400,
    );
  }
}
