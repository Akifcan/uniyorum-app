import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData customTheme = ThemeData(
  primaryColor: Colors.blue[700],
  textTheme: TextTheme(
    headline1: GoogleFonts.montserrat(
      color: Colors.white,
      fontSize: 30
    ),
    headline2: GoogleFonts.montserrat(
      color: Colors.black,
      fontSize: 20
    ),
    headline3: GoogleFonts.montserrat(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
     headline4: GoogleFonts.montserrat(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    headline5: GoogleFonts.montserrat(
      color: Colors.black,
      fontSize: 30
    ),
    headline6: GoogleFonts.robotoMono(
      fontSize: 20,
      color: Colors.black
    )
  )
);