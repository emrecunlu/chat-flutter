import 'package:chat_client/core/services/socket_service.dart';
import 'package:chat_client/core/viewmodels/base_viewmodel.dart';
import 'package:chat_client/ui/helpers/auth_helper.dart';
import 'package:flutter/material.dart';

class ChatViewModel extends BaseViewModel {
  final SocketService _socketService = SocketService.instance;

  ChatViewModel() {
    _socketService.streamController.stream.listen((event) {
      debugPrint(event);
    });
  }

  Future<void> logout() async {
    await AuthHelper.logout();
  }
}
