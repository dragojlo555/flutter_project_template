import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Themes {
  static ThemeData darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.blueWhale,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 15,
    appBarStyle: FlexAppBarStyle.background,
    appBarOpacity: 0.90,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 30,
      inputDecoratorBorderType: FlexInputBorderType.underline,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    // To use the playground font, add GoogleFonts package and uncomment
    fontFamily: GoogleFonts.roboto().fontFamily,
  ).copyWith(
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  }));

  static ThemeData lightTheme = FlexThemeData.light(
    scheme: FlexScheme.blumineBlue,
    scaffoldBackground: Colors.white,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 20,
    appBarOpacity: 0.95,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      blendOnColors: false,
      inputDecoratorBorderType: FlexInputBorderType.underline,
      appBarBackgroundSchemeColor: SchemeColor.primary,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: false,
    // To use the playground font, add GoogleFonts package and uncomment
    fontFamily: GoogleFonts.roboto().fontFamily,
  );
  //     .copyWith(
  //     pageTransitionsTheme: const PageTransitionsTheme(builders: {
  //   TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
  //   TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  // }));
}
