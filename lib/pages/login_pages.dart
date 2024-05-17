import 'package:login_firebase/components/login_button.dart';
import 'package:login_firebase/helper/helper_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_firebase/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void login() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(color: Color(0xfff35702),strokeWidth: 10, strokeAlign: 4,),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (mounted) {
        // Check if widget is still mounted before accessing context
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        // Check if widget is still mounted before accessing context
        Navigator.pop(context);
        displayMessageToUser(e.code, context);
      }
    }
    // try {

    //   if (mounted) {
    //     // Check if widget is still mounted before accessing context
    //     Navigator.pop(context);
    //   }
    // } on FirebaseAuthException catch (e) {
    //   if (mounted) {
    //     // Check if widget is still mounted before accessing context
    //     Navigator.pop(context);
    //     displayMessageToUser(e.code, context);
    //   }
    // }
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
                      child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        //username textfield
                        const SizedBox(height: 40),
                        MyTextfield(
                          hintText: 'Masukkan Email',
                          obscureText: false,
                          controller: emailController,
                          prefixIcon: const Icon(Icons.email),
                        ),
                        const SizedBox(height: 40),
                        MyTextfield(
                          hintText: 'Masukkan Password',
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
                        const SizedBox(height: 80),

                        LoginButton(
                          text: 'LOGIN',
                          onTap: login,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tidak punya akun? ',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                            ),
                            GestureDetector(
                              onTap: widget.onTap, // Use widget.onTap here
                              child: const Text(
                                'Buat akun dulu',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                )
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
//     return LoginPage(onTap: onTap);
//   }
// }
