import 'package:flutter/material.dart';

class BasicTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double size;
  const BasicTextButton({
    required this.onPressed,
    required this.text,
    required this.size, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: size,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white),
        ));
  }
}