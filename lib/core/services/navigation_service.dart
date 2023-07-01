import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future nextScreen(dynamic screen) async {
    await navigatorKey.currentState!.push(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }

  static Future replaceScreen(dynamic screen) async {
    await navigatorKey.currentState!.pushReplacement(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }

  static Future closeAll(dynamic screen) async {
    await navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
      (route) => false,
    );
  }
}
