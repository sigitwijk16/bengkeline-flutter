import 'dart:async';
import 'package:bengkeline/pages/home_screen.dart';
import 'package:bengkeline/pages/on_boarding1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delay for 3 seconds before validating onboarding.
    Timer(const Duration(seconds: 3), () {
      _validateOnboarding();
    });
  }

  Future<void> _validateOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
            hasSeenOnboarding ? HomeScreen() : OnboardingPage1(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/splash_bg.jpg'), // Change to your image path.
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
