import 'package:chat_client/core/services/navigation_service.dart';
import 'package:chat_client/core/services/storage_service.dart';
import 'package:chat_client/ui/views/auth/login/login_view.dart';
import 'package:chat_client/ui/views/chat/chat/chat_view.dart';
import 'package:chat_client/ui/widgets/common/base_widget.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends BaseWidget<SplashView> {
  Future<void> authCheck() async {
    await Future.delayed(Duration(milliseconds: 500));
    final StorageService _storageService = StorageService.instance;

    if (_storageService.getString("token").isEmpty) {
      NavigationService.replaceScreen(LoginView());
      return;
    }

    NavigationService.replaceScreen(ChatView());
  }

  @override
  void initState() {
    authCheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: themeData.primaryColor,
        ),
      ),
    );
  }
}
