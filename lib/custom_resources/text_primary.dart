import 'package:flutter/material.dart';

class TextPrimary {
  // Define your custom font family name.
  static const String fontFamily = 'Poppins';

  // Define custom text styles.
  static const TextStyle heading = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 24.0,
    color: Color(0xFF4C4F6E),
  );

  static const TextStyle heading2 = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
    color: Color(0xFF4C4F6E),
  );

  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 12.0,
    color: Colors.black,
  );
  // Define additional text styles as needed.
}
