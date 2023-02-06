import 'package:flutter/material.dart';

import 'login_page.dart';
import 'sign_up.dart';

class AuthPagr extends StatefulWidget {
  const AuthPagr({super.key});

  @override
  State<AuthPagr> createState() => _AuthPagrState();
}

class _AuthPagrState extends State<AuthPagr> {
  bool showLoginPage = true;

  void toggleScreens () {
    setState(() {
      showLoginPage =! showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showSignUpPage: toggleScreens);
    } else {
      return SignUpPage(showLoginPage: toggleScreens);
    }
  }
}