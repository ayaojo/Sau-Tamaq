import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/common/custom_btn.dart';
import 'package:sau_tamaq_flutter/common/my_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text edit controller
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50.0),
              const Icon(Icons.lock, size: 100, color:Color(0xffE94D01)),
              const SizedBox(height: 50.0),
              const Text(
                'Welcome, back!',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 25.0),
              MyTextField(
                controller: userNameController,
                hintText: 'Username',
                obscureText: false,
              ),
              const SizedBox(height: 10.0),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 15.0),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'forgot password?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25.0),
              CustomBtn(
                onTap: signUserIn,
              ),
              const SizedBox(height: 50.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?'),
                  SizedBox(width: 4.0),
                  Text(
                    'Register',
                    style: TextStyle(
                        color: Color(0xffE94D01), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
