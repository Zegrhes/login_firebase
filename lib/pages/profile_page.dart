import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final bool isAdmin; // Add a field to store isAdmin value

  const ProfilePage({super.key, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Color(0xfff35702), size: 35,),
            onPressed: () {},
          ),
          if (isAdmin) // Only show admin icon if isAdmin is true
            IconButton(
              icon: const Icon(Icons.admin_panel_settings, color: Color(0xfff35702), size: 35,), // Replace with your desired admin icon
              onPressed: () {
                // Handle admin panel functionality
              },
            ),
        ],
      ),
    );
  }
}

