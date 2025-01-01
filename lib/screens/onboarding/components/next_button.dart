import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextButton({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        "Next",
        style: GoogleFonts.comfortaa(
          fontSize: 20,
          fontWeight: FontWeight.w600, // Semi-bold
          color: Color(0xff052A43), // Text color
        ),
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Color(0xffFDC70A)),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
        textStyle: WidgetStateProperty.all<TextStyle>(
          GoogleFonts.comfortaa(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)), // Changed to 15
        ),
        elevation: WidgetStateProperty.all<double>(5),
      ),
    );
  }
}
