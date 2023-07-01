import 'package:chat_client/core/services/socket_service.dart';
import 'package:chat_client/core/viewmodels/chat/chat_viewmodel.dart';
import 'package:chat_client/ui/views/base_view.dart';
import 'package:chat_client/ui/views/chat/chat/widgets/send_message_field.dart';
import 'package:chat_client/ui/widgets/common/base_widget.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends BaseWidget<ChatView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ChatViewModel>(
      onModelReady: (model) {
        SocketService.instance.connect();
        SocketService.instance.getMessages();
      },
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: _buildAppBar(model),
          body: SafeArea(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder<String>(
                      stream: SocketService.instance.streamController.stream,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("Error"),
                          );
                        }

                        return Text(snapshot.data.toString());
                      },
                    ),
                  ),
                  SendMessageField(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  AppBar _buildAppBar(ChatViewModel model) {
    return AppBar(
      title: Text("Chat Odası"),
      actions: [
        IconButton(
          onPressed: () {
            model.logout();
          },
          icon: Icon(Icons.logout),
        )
      ],
    );
  }
}
