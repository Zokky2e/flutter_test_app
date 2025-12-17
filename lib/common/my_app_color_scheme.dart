import 'package:flutter/material.dart';

class MyAppColorScheme extends ColorScheme {
  // Define your custom colors here
  static const Color myPrimaryColor = Color.fromARGB(255, 153, 170, 181);
  static const Color mySecondaryColor = Color.fromARGB(255, 44, 47, 51);
  static const Brightness myBrightness = Brightness.dark;
  static const Color myOnPrimary = Color.fromARGB(255, 255, 255, 255);
  static const Color myOnSecondary = Color.fromARGB(255, 153, 170, 181);
  static const Color myError = Color.fromARGB(255, 251, 24, 24);
  static const Color myOnError = Color.fromARGB(255, 114, 30, 30);
  static const Color mySurface = Color.fromARGB(255, 29, 26, 33);
  static const Color myOnSurface = Color.fromARGB(255, 21, 20, 25);

  // Override the constructor
  const MyAppColorScheme({
    // Set your custom colors as primary and secondary
    super.primary = myPrimaryColor,
    super.secondary = mySecondaryColor,
    super.brightness = myBrightness,
    super.onPrimary = myOnPrimary,
    super.onSecondary = myOnSecondary,
    super.error = myError,
    super.onError = myOnError,
    super.surface = mySurface,
    super.onSurface = myOnSurface,

    // Include other color properties from the super class
    // such as background, surface, onBackground, etc.
  });
}
