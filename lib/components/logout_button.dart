import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Logout'),
      content: const Text('Apakah Anda yakin ingin logout?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Menutup dialog
          },
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            
            FirebaseAuth.instance.signOut(); // Melakukan logout
            Navigator.of(context).pop(); // Menutup dialog
          },
          child: const Text('Logout'),
        ),
        
      ],
    );
  }
}
