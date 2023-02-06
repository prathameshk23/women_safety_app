// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, duplicate_ignore

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_textfield.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignUpPage({super.key, required this.showLoginPage});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //text controller
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  Future signUp() async {
    showDialog(
        context: context,
        builder: ((context) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.yellow,
          ));
        }));

    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim());
    Navigator.of(context).pop();
    return const HomePage();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                Icon(
                  Icons.app_registration_rounded,
                  size: 100,
                  color: Colors.purple.shade900,
                ),

                const SizedBox(height: 20),

                // welcome back, you've been missed!
                // ignore: prefer_const_constructors
                Text(
                  'Register here',
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: _passController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),
                const MyTextField(
                  controller: null,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(height: 25),

                // sign up button
                GestureDetector(
                  onTap: signUp,
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.purple[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        'Login now',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
