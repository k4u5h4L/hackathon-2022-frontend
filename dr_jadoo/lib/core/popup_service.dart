import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:dr_jadoo/constants/colours.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final PopupsService popupsService = PopupsService();

class PopupsService {
  Future<T?> showDialog<T>(BuildContext context, {required Widget widget}) {
    return showGeneralDialog<T>(
      transitionDuration: const Duration(milliseconds: 300),
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          widget,
      transitionBuilder: (BuildContext buildContext,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: child,
        );
      },
    );
  }

  Future<void> showBottomSheet(BuildContext context, Widget widget) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }

  void showToast(
    String message, {
    Toast toastLength = Toast.LENGTH_SHORT,
    double fontSize = 12.0,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Color backgroundColor = AppColors.error,
    Color textColor = AppColors.white,
  }) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: toastLength,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize);
  }

  dynamic showFlushBar(
    BuildContext context,
    String message, {
    IconData icon = Icons.error_outline_rounded,
    Color iconColor = AppColors.white,
    bool isDismissible = true,
    Color backgroundColor = AppColors.error,
    Duration duration = const Duration(seconds: 3),
    FlushbarPosition flushbarPosition = FlushbarPosition.BOTTOM,
  }) {
    return Flushbar(
      message: message,
      borderRadius: BorderRadius.circular(8),
      margin: const EdgeInsets.all(8),
      backgroundColor: backgroundColor,
      flushbarPosition: flushbarPosition,
      isDismissible: isDismissible,
      maxWidth: 150,
      icon: Icon(
        icon,
        color: iconColor,
      ),
      duration: duration,
    )..show(context);
  }

  Future<DateTime?> selectDateFromPicker(BuildContext context,
      DateTime? firstDate, DateTime? lastDate, DateTime? currentDate) async {
    return await showDatePicker(
      context: context,
      initialDate: currentDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime(2050),
    );
  }
}
