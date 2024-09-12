import 'dart:ui';
import 'package:flutter/material.dart';

class ChatPageDialogs {
  blurDialog(BuildContext context,
      {String? title, String? message, Function? onYesPressed}) {
    showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black38,
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (ctx, anim1, anim2) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: title == null ? null : Text(title),
        content: message == null ? null : Text(message),
        elevation: 6,
        actions: [
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text("No"),
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green,
              ),
              child: const Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Yes"),
              ),
            ),
            onTap: () {
              onYesPressed?.call();
            },
          ),

        ],
      ),
      transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
        filter:
            ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
        child: FadeTransition(
          opacity: anim1,
          child: child,
        ),
      ),
      context: context,
    );
  }
}
