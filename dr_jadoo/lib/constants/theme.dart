import 'package:dr_jadoo/constants/colours.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  focusColor: AppColors.primaryColor,
  primarySwatch: Colors.blue,
  primaryColor: AppColors.primaryColor,
  secondaryHeaderColor: AppColors.backgroundColor,
  selectedRowColor: AppColors.backgroundColor,
  cardColor: AppColors.backgroundColor,
  bottomAppBarColor: AppColors.primaryColor,
  backgroundColor: AppColors.backgroundColor,
  canvasColor: AppColors.backgroundColor,
  iconTheme: IconThemeData(color: AppColors.primaryColor),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
  ),
  textTheme: GoogleFonts.ramarajaTextTheme().apply(
    bodyColor: AppColors.textColor,
    displayColor: AppColors.textColor,
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: AppColors.backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
  /* light theme settings */
);