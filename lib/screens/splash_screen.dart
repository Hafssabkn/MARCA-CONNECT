import 'package:flutter/material.dart';
import 'package:flutter_animated_splash/flutter_animated_splash.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'start.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplash(
        type: Transition.fade,
        navigator: const Start(),
        durationInSeconds: 3,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('images/Marsa_connect_logo-1.png'),
                width: 600,
                height: 100,
              ),
              LoadingAnimationWidget.twistingDots(
                leftDotColor: const Color(0xFF0083bd),
                rightDotColor: const Color(0xFF003f6c),
                size: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
