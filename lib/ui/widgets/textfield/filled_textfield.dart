import 'package:chat_client/ui/widgets/common/base_widget.dart';
import 'package:flutter/material.dart';

class FilledTextField extends StatefulWidget {
  final String title;
  final TextEditingController? controller;
  final bool secure;

  const FilledTextField({
    super.key,
    required this.title,
    this.controller,
    this.secure = false,
  });

  @override
  State<FilledTextField> createState() => _FilledTextFieldState();
}

class _FilledTextFieldState extends BaseWidget<FilledTextField> {
  late bool _isVisible;

  @override
  void initState() {
    setState(() {
      _isVisible = widget.secure;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(fontSize: 15, color: themeData.primaryColor),
      decoration: InputDecoration(
        hintText: widget.title,
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(36),
        ),
        suffixIcon: widget.secure
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                child: Icon(
                  _isVisible ? Icons.visibility : Icons.visibility_off,
                  color: themeData.primaryColor,
                ),
              )
            : null,
      ),
      obscureText: _isVisible,
    );
  }
}
