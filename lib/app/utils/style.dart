import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double defaultMargin = 30;
const double verticalMargin = 24;

Color primaryColor = const Color(0xffEEEEEE);
Color backgroundColor = const Color(0xffFDFDFD);
Color secondaryColor = const Color(0xFFD8D8D8);
Color whiteColor = const Color(0xffFFFFFF);
Color accentColor = const Color(0xffFF6464);
Color toggleColor = const Color(0xff60D141);
Color buttonColor = const Color(0xffF0F8FF);
Color warningColor = const Color(0xffFFEDEA);

Color primaryTextColor = const Color(0xff000000);
Color nameTextColor = const Color(0xff60D141);
Color headerTextColor = const Color(0xff432883);
Color buttonTextColor = const Color(0xff4994FF);
Color warningTextColor = const Color(0xffFF7760);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w900;

const double xSmallFs = 10;
const double smallFs = 12;
const double baseFs = 14;
const double mediumFs = 16;
const double largeFs = 18;
const double titleFs = 20;

TextStyle primaryTextStyle = GoogleFonts.poppins(color: primaryTextColor, fontSize: mediumFs);
TextStyle nameTextStyle = GoogleFonts.poppins(color: nameTextColor, fontSize: smallFs);
TextStyle titleTextStyle = GoogleFonts.poppins(color: headerTextColor, fontSize: titleFs, fontWeight: bold);
TextStyle headerTextStyle = GoogleFonts.poppins(color: headerTextColor, fontSize: mediumFs);
TextStyle attributeTextStyle = GoogleFonts.poppins(color: primaryTextColor, fontSize: xSmallFs);
TextStyle buttonTextStyle = GoogleFonts.poppins(color: buttonTextColor, fontSize: mediumFs, fontWeight: semiBold);
TextStyle warningTextStyle = GoogleFonts.poppins(color: warningTextColor, fontSize: mediumFs, fontWeight: semiBold);
TextStyle settingTextStyle = GoogleFonts.poppins(color: headerTextColor, fontSize: mediumFs);

const String diagnose = """Your Blood Oxygen Levels have been
found to be abnormally low quite a
few times that may indicate presence
of an infection. If you are experiencing
any other symptom like Fever,
Headache, Dry Cough or Difficulty
breathing, contact your nearest
Covid-19 Health facility immediately
by clicking the seek help button.""";