import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
   const MyTextfield(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller,
      this.prefixIcon,
      this.suffixIcon
      });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final desiredWidth = screenWidth * (5 / 6);
    final screenHeight = MediaQuery.of(context).size.height;
    final desiredHeight = screenHeight * (1.5 / 20);

    return TextField(
      cursorColor: Theme.of(context).colorScheme.inversePrimary,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          suffixIconColor: Theme.of(context).colorScheme.inversePrimary,
            fillColor: Theme.of(context).colorScheme.primary,
            filled: true,
            focusColor: Theme.of(context).colorScheme.inversePrimary,
            prefixIconColor: Theme.of(context).colorScheme.inversePrimary,
            constraints: BoxConstraints(
                maxWidth: desiredWidth, maxHeight: desiredHeight),
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(80),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(80),
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.inversePrimary)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(80),
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.inversePrimary)),
            prefixIcon: prefixIcon,
             prefixIconConstraints: const BoxConstraints(
              
      minWidth: 55, // Lebar prefixIcon
    ),
   
    ));
  }
}
