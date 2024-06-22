import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/common/reusable_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback showLoginTab;

  const SignUpPage({super.key, required this.showLoginTab});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Ornament.png'),
                alignment: Alignment.topLeft,
                opacity: 0.45,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  backBtn(context),
                  const SizedBox(height: 150.0),
                  accountMainTextStyle('Регистрация'),
                  const SizedBox(height: 30.0),
                  const SizedBox(height: 15.0),
                  textFieldForm('Почта', Icons.email, false, _emailController),
                  const SizedBox(height: 15.0),
                  textFieldForm(
                      'Пароль', Icons.lock, true, _passwordController),
                  const SizedBox(height: 15.0),
                  textFieldForm(
                      'Пароль', Icons.lock, true, _confirmPasswordController),
                  const SizedBox(height: 20),
                  customButton(context, false, signUp),
                  logInOption(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row logInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        accountSubTextStyle('Уже есть аккаунт?'),
        const SizedBox(width: 3.0),
        TextButton(
          onPressed: widget.showLoginTab,
          child: const Text(
            'Войти',
            style: TextStyle(
                color: Color(0xffE94D01), fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
