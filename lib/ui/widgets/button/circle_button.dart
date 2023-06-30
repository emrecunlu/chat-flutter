import 'package:chat_client/ui/widgets/common/base_widget.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final VoidCallback onPress;
  final Widget? icon;
  final String title;
  const CircleButton({
    super.key,
    required this.onPress,
    this.icon,
    required this.title,
  });

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends BaseWidget<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
        ),
        onPressed: widget.onPress,
        icon: widget.icon == null ? SizedBox.shrink() : widget.icon!,
        label: Text('${widget.title}'),
      ),
    );
  }
}
