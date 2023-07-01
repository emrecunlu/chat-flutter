import 'package:chat_client/core/services/navigation_service.dart';
import 'package:chat_client/core/services/socket_service.dart';
import 'package:chat_client/core/services/storage_service.dart';
import 'package:chat_client/locator.dart';
import 'package:chat_client/ui/helpers/snackbar_helper.dart';
import 'package:chat_client/ui/init/app_theme.dart';
import 'package:chat_client/ui/views/common/splash_view.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await StorageService.instance.initialize();
  SocketService.instance.initialize("http://192.168.1.39:3000");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      theme: appTheme,
      scaffoldMessengerKey: SnackbarHelper.snackbarKey,
      navigatorKey: NavigationService.navigatorKey,
    );
  }
}
