import 'package:flutter/material.dart';
import 'package:flutter_pluzzle/Core/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w700,
        fontSize: 23,
      ),
    ),
    headline2: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: AppColors.greyColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
    subtitle1: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: AppColors.blackColor,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
