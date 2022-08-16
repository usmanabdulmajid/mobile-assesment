import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:mobile_assesment/utils/constants.dart';

class Alert {
  static showFlushbar(BuildContext context, {String? text}) {
    var flushbar = Flushbar(
      message: text,
      margin: const EdgeInsets.all(kmediumspace),
      padding: const EdgeInsets.all(kmediumspace),
      borderRadius: BorderRadius.circular(ksmallspace),
      icon: const Icon(Icons.check_circle_outline_rounded, color: Colors.white),
      backgroundColor: Colors.green,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 3),
    );
    flushbar.show(context);
  }
}
