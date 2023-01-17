import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

abstract class Themes {
  static ThemeData darkTheme = FlexThemeData.dark(
    scheme: FlexScheme.sakura,
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
    scheme: FlexScheme.sakura,
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




  // This is for custom theme

  // static ThemeData darkTheme = ThemeData(
  //   brightness: Brightness.dark,
  //   primaryColor: darkBlue,
  //   scaffoldBackgroundColor: lightBlue,
  //   textTheme: const TextTheme(
  //     bodyText1: TextStyle(
  //       color: Colors.white,
  //     ),
  //   ),
  // );
  //
  // static ThemeData lightTheme = ThemeData(
  //   brightness: Brightness.light,
  //   primaryColor: AppColors.secondaryColor,
  //   scaffoldBackgroundColor: AppColors.secondaryColor,
  //   backgroundColor: AppColors.primaryColor,
  //   textTheme: const TextTheme(
  //     headline1: TextStyle(
  //       fontFamily: 'Rany',
  //       fontSize: 36,
  //       height: 1.2,
  //       fontWeight: FontWeight.w500,
  //       color: AppColors.primaryColor,
  //     ),
  //     headline2: TextStyle(
  //       fontFamily: 'Rany',
  //       fontSize: 30,
  //       fontWeight: FontWeight.w500,
  //       color: AppColors.primaryColor,
  //     ),
  //     headline3: TextStyle(
  //       fontFamily: 'Rany',
  //       fontSize: 24,
  //       fontWeight: FontWeight.w600,
  //       color: AppColors.primaryColor,
  //     ),
  //     headline4: TextStyle(
  //       fontFamily: 'Rany',
  //       fontSize: 20,
  //       fontWeight: FontWeight.w500,
  //       color: AppColors.primaryColor,
  //     ),
  //     headline5: TextStyle(
  //       fontFamily: 'Poppins',
  //       fontSize: 14,
  //       fontWeight: FontWeight.w500,
  //       color: AppColors.primaryColor,
  //     ),
  //     headline6: TextStyle(
  //       fontFamily: 'Poppins',
  //       fontSize: 12,
  //       fontWeight: FontWeight.w500,
  //       color: AppColors.primaryColor,
  //     ),
  //     bodyText1: TextStyle(
  //         fontFamily: 'Poppins',
  //         fontSize: 12,
  //         fontWeight: FontWeight.w400,
  //         color: AppColors.bodyColor,
  //         height: 1.8),
  //     bodyText2: TextStyle(
  //       fontFamily: 'Poppins',
  //       fontSize: 14,
  //       height: 1.8,
  //       fontWeight: FontWeight.w400,
  //       color: AppColors.bodyColor,
  //     ),
  //   ),
  //   inputDecorationTheme: const InputDecorationTheme(
  //     border: OutlineInputBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(10)),
  //       borderSide: BorderSide(
  //         color: AppColors.secondaryColor,
  //         style: BorderStyle.solid,
  //         width: 1,
  //       ),
  //     ),
  //     floatingLabelStyle: TextStyle(
  //       color: AppColors.bodyColor,
  //       fontWeight: FontWeight.w500,
  //       fontSize: 12,
  //       fontFamily: 'Poppins',
  //     ),
  //     hintStyle: TextStyle(
  //       fontFamily: "Poppins",
  //       fontWeight: FontWeight.w400,
  //       fontSize: 14,
  //       color: primaryBlack,
  //     ),
  //     labelStyle: TextStyle(
  //       fontFamily: 'Poppins',
  //       fontWeight: FontWeight.w400,
  //       fontSize: 14,
  //     ),
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(10)),
  //       borderSide: BorderSide(
  //         color: AppColors.bodyColorDark,
  //         style: BorderStyle.solid,
  //         width: 1,
  //       ),
  //     ),
  //   ),
  // );



}
