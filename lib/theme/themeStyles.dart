import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeColor {
  static const Color primeryColor = Color(0xfffbb448);
  static const Color primeryColorDim = Color(0xffeb8c44);
  static const Color primeryColorHard = Color(0xffe46b10);
  static const Color smoothDangerColor = Color(0xffff0011);
}

class ThemeStyles {
  static final title = GoogleFonts.roboto(
    color: ThemeColor.primeryColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static final bigTitle = GoogleFonts.roboto(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  static final invertedTitle = GoogleFonts.roboto(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static final normalText = GoogleFonts.roboto(
    color: Colors.grey[800],
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static final dimText = GoogleFonts.roboto(
    color: Colors.grey[500],
    fontSize: 14,
  );
  static final miniText = GoogleFonts.roboto(
    color: Colors.grey[500],
    fontSize: 12,
  );
  static final thinAndBigText = GoogleFonts.roboto(
    color: Colors.grey[500],
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static final appBarText = GoogleFonts.openSans(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final containerBackgroundDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    boxShadow: <BoxShadow>[
      BoxShadow(
          color: Colors.grey.shade200,
          offset: Offset(2, 4),
          blurRadius: 5,
          spreadRadius: 2)
    ],
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [ThemeColor.primeryColor, ThemeColor.primeryColorHard]),
  );
}
