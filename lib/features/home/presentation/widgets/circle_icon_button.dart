import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onTapIconButton,
  });
  final Icon icon;
  final VoidCallback onTapIconButton;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapIconButton,
      child: CircleAvatar(
        radius: 16,
        child: icon,
        backgroundColor: Colors.grey.withAlpha(50),
      ),
    );
  }
}