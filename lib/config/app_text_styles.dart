import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles{
  static final TextStyle title = GoogleFonts.quantico(
    fontSize: 40,
    color: Color(0xFF4F4F4F),
    fontWeight: FontWeight.w600,
  );
  static final TextStyle button = GoogleFonts.quantico(
    fontSize: 20,
    color: Colors.white,
    // fontWeight: FontWeight.w600,
  );
  static final TextStyle body = GoogleFonts.quantico(
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle titleGolden = GoogleFonts.quantico(
    fontSize: 30,
    color: Color(0xFFAE841A),
    fontWeight: FontWeight.w600,
  );
  static final TextStyle subtituloGolden = GoogleFonts.quantico(
    fontSize: 30,
    color: Color(0xFF808080),
    fontWeight: FontWeight.w600,
  );

  static final TextStyle titleDetalhes = GoogleFonts.roboto(
    fontSize: 17,
    color: Color(0xFFA373737),
    fontWeight: FontWeight.w400,
  );
  static final TextStyle subtitleDetalhes = GoogleFonts.quantico(
    fontSize: 15,
    color: Color(0xFFA1f1f1f),
    fontWeight: FontWeight.w200,
  );
  static final TextStyle fontNumber = GoogleFonts.quantico(
    fontSize: 15,
    color: Color(0xFFA373737),
    fontWeight: FontWeight.w300,
  );

  static final TextStyle goldenList = GoogleFonts.quantico(
    fontSize: 15,
    color: Color(0xFFAE841A),
    fontWeight: FontWeight.w600,
  );

}