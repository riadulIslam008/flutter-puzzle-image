import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onTap,
    required this.backgroundColor,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: const BorderSide(
            color: Colors.teal,
            width: 3,
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
