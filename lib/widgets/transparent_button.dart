import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  TransparentButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white, // White color for the outer line/stroke.
          width: 2.0, // Adjust the width of the outer line as needed.
        ),
        borderRadius:
            BorderRadius.circular(8.0), // Adjust the border radius as needed.
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
