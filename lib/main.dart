import 'package:chat_client/locator.dart';
import 'package:chat_client/ui/helpers/snackbar_helper.dart';
import 'package:chat_client/ui/init/app_theme.dart';
import 'package:chat_client/ui/views/auth/login/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),
      theme: appTheme,
      scaffoldMessengerKey: SnackbarHelper.snackbarKey,
    );
  }
}
