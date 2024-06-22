import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/features/authentication/log_in_page.dart';
import 'package:sau_tamaq_flutter/features/authentication/sign_up_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // initally show the login page
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LogInPage(showRegisterTab: toggleScreens);
    } else {
      return SignUpPage(showLoginTab: toggleScreens);
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   if (showLoginPage){
  //     return LoginTab(showRegisterTab: toggleScreens);
  //   } else {
  //     return RegisterTab(showLoginTab: toggleScreens);
  //   }
  // }
}
