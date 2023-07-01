import 'package:chat_client/ui/widgets/common/base_widget.dart';
import 'package:chat_client/ui/widgets/textfield/filled_textfield.dart';
import 'package:flutter/material.dart';

class SendMessageField extends StatefulWidget {
  const SendMessageField({super.key});

  @override
  State<SendMessageField> createState() => _SendMessageFieldState();
}

class _SendMessageFieldState extends BaseWidget<SendMessageField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      width: double.infinity,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.photo_camera,
              color: themeData.primaryColor,
              size: 24,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: FilledTextField(
              title: "Type your message",
            ),
          ),
        ],
      ),
    );
  }
}
