import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const CircularLoader({super.key, required this.isLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    List<Widget> _childrens = [child];

    if (isLoading) {
      _childrens.add(_buildLoader());
    }
    return Stack(
      children: _childrens,
    );
  }

  Widget _buildLoader() {
    return Container(
      color: Colors.black.withOpacity(.65),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
