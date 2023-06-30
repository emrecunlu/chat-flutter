import 'package:flutter/material.dart';

class SnackbarHelper {
  static GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();

  static void show({required String title}) {
    snackbarKey.currentState!.hideCurrentSnackBar();
    snackbarKey.currentState!.showSnackBar(
      SnackBar(
        content: Text('$title'),
        showCloseIcon: true,
        closeIconColor: Colors.white,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
