// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, avoid_unnecessary_containers, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showSignUpPage;
  const LoginPage({Key? key, required this.showSignUpPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controler

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  Future signIn() async {
    showDialog(
        context: context,
        builder: ((context) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.yellow,
          ));
        }));

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passController.text.trim());

    Navigator.of(context).pop();
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                // logo
                Icon(
                  Icons.woman,
                  size: 130,
                  color: Colors.purple.shade900,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
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

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  onTap: signIn,
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.showSignUpPage,
                      child: Text(
                        'Register now',
                        style: TextStyle(
                          fontSize: 16,
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
