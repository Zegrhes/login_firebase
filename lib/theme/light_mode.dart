import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    
    background: Colors.grey.shade300,
    primary: Colors.white,
    secondary: Colors.grey.shade400,
    inversePrimary: Colors.grey.shade500,

  ),
textTheme: ThemeData.light().textTheme.apply(
  bodyColor: Colors.grey[800],
  displayColor: Colors.black
)
);
