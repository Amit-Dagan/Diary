import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double ? height;
  const BasicAppButton({required this.onPressed, required this.title, super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 24,
            color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(280, 80),
        backgroundColor: const Color(0xFFF27171)


      ),

    );
  }
}
