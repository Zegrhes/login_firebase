import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const LoginButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final desiredWidth = screenWidth * (5 / 6);
    final screenHeight = MediaQuery.of(context).size.height;
    final desiredHeight = screenHeight * (1.5 / 20);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: desiredWidth,
        height: desiredHeight,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(80)
            ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xfff35702), letterSpacing: 4),
          ),
        ),
      ),
    );
  }
}
