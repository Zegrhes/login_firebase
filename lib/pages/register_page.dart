import 'dart:convert';

import 'package:login_firebase/components/login_button.dart';
import 'package:login_firebase/helper/helper_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_firebase/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crypto/crypto.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  bool _obscureText2 = true;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPwController = TextEditingController();

  void register() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Color(0xfff35702),
          strokeWidth: 10,
          strokeAlign: 4,
        ),
      ),
    );

    if (passwordController.text != confirmPwController.text) {
      Navigator.pop(context);
      displayMessageToUser('Password tidak sama', context);
      return; // Exit function early if passwords don't match
    }

    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (mounted) {
        // Check if widget is still mounted before accessing context
        Navigator.pop(context);
      }

      // Get the currently registered user
      final user = userCredential.user!;

      // Prepare user data with username and isAdmin
      final userData = {
        'user_id': user.uid, // Use the generated uid
        'username': usernameController.text, // Assuming you have a username controller
        'email': emailController.text, // Assuming you have a email controller // Set isAdmin to true by default
        'password': sha256
            .convert(utf8.encode(passwordController.text))
            .toString(), // Password
        'isAdmin': true,
      };

      // Add additional fields (e.g., email) if needed
      // userData['email'] = user.email as Object;

      // Write user data to Firestore (assuming you have a Firestore instance)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(userData);
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        // Check if widget is still mounted before accessing context
        Navigator.pop(context);
        displayMessageToUser(e.code, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset('assets/bjbeatery.png',
                      width: MediaQuery.of(context).size.width * (285 / 360)),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: const BoxDecoration(
                        color: Color(0xfff35702),
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(80))),
                    child: Center(
                      child: Column(
                        children: [
                          //username textfield
                          const SizedBox(height: 20),
                          MyTextfield(
                            hintText: 'Username',
                            obscureText: false,
                            controller: usernameController,
                            prefixIcon: const Icon(Icons.person),
                          ),
                          const SizedBox(height: 20),
                          MyTextfield(
                            hintText: 'Email',
                            obscureText: false,
                            controller: emailController,
                            prefixIcon: const Icon(Icons.mail),
                          ),
                          const SizedBox(height: 20),
                          MyTextfield(
                            hintText: 'Password',
                            obscureText: _obscureText,
                            controller: passwordController,
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          MyTextfield(
                            hintText: 'Password',
                            obscureText: _obscureText2,
                            controller: confirmPwController,
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText2
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText2 = !_obscureText2;
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 40),

                          LoginButton(
                            text: 'REGISTER',
                            onTap: register,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'sudah punya akun? ',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inversePrimary),
                              ),
                              GestureDetector(
                                onTap: widget.onTap,
                                child: const Text(
                                  'Masuk disini',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
              ],
            )
          ],
          //app name
        ),
      ),
    );
  }
}

// class MyParentWidget extends StatelessWidget {
//   final void Function()? onTap;

//   const MyParentWidget({super.key, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return RegisterPage(onTap: onTap);
//   }
// }
