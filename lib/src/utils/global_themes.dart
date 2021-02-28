import 'package:flutter/material.dart';

Color primaryColor = Color(0xffFFA64D);

Color accentColor = Color(0xffFFDFBF);

Color brown = Color(0xff99642E);

Color canvasColor = Colors.white;

Color disabledGrey = Color(0xffbbbbbb);

BorderRadius borderRadius5 = BorderRadius.circular(5);
BorderRadius borderRadiusButton = BorderRadius.circular(5);

TextStyle boldHeading = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

TextStyle bigText = TextStyle(
  fontSize: 32,
  color: brown,
  fontWeight: FontWeight.bold,
);

TextStyle greyText = TextStyle(
  color: Colors.grey[700],
);

TextStyle defaultText = TextStyle(color: brown);

final ThemeData appThemeData = ThemeData(
  fontFamily: 'Montserrat',
  primaryColor: primaryColor,
  accentColor: accentColor,
  canvasColor: canvasColor,
  dialogTheme: DialogTheme(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius5,
    ),
  ),
  buttonTheme: ButtonThemeData(
    disabledColor: disabledGrey,
    buttonColor: primaryColor,
    // te1xtTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius5,
    ),
  ),
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
    },
  ),
  appBarTheme: AppBarTheme(
    color: canvasColor,
    elevation: 0,
  ),  
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: borderRadius5,
      borderSide: BorderSide.none,
    ),
    fillColor: Colors.white,
    filled: true,
  ),
);
