import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

void showFlashSnackBar(BuildContext context, {required String message}) {
  showFlash(
    context: context,
    duration: const Duration(seconds: 3),
    builder: (_, controller) {
      return FlashBar(
        controller: controller,
        position: FlashPosition.top,
        behavior: FlashBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        // boxShadows: kElevationToShadow[8],
        titleTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
        content: Text(message),
      );
    },
  );
}
