import 'package:login_firebase/pages/main_page_admin.dart';
import 'package:login_firebase/pages/main_page_user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_firebase/auth/login_or_register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); // Show loading indicator while waiting
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}')); // Handle errors gracefully
        }

        
        if (snapshot.hasData) {
          final user = snapshot.data!;
          return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots(),
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator()); // Show loading indicator for user data
              }

              if (userSnapshot.hasError) {
                return Center(child: Text('Error: ${userSnapshot.error}')); // Handle errors gracefully
              }

              if (userSnapshot.hasData) {
                final userData = userSnapshot.data!.data();
                final isAdmin = userData?['isAdmin'] ?? true; // Check for 'isAdmin' field and default to true if absent(true or false tidak ada bedanya)
                return isAdmin ? const MainPageAdmin() : const MainPageUser(); // Conditional routing based on isAdmin
              }else{
                return const LoginOrRegister(); // Default case if user data is missing
              }

              
            },
          );
        }

        return const LoginOrRegister(); // Default case for unauthenticated users
      },
    );
  }
}


