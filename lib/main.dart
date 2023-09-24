import 'package:flutter/material.dart';
import 'package:bengkeline/pages/splash_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(colorScheme: ColorScheme.light()),
      debugShowCheckedModeBanner: false,
      initialRoute:
          '/splash', // Set the initial route to your custom splash screen.
      routes: {'/splash': (context) => SplashScreen()},
    );
  }
}
