import 'package:bengkeline/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/onboarding5.jpg'), // Change to your image path.
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Welcome to Onboarding Page 5'),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the main content or home screen of your app here.
                  // For this example, we'll navigate to a hypothetical HomeScreen.
                  _markOnboardingComplete();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _markOnboardingComplete() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('hasSeenOnboarding', true);
}
