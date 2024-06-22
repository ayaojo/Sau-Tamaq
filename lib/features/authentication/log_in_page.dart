import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/common/reusable_widgets.dart';
import 'package:sau_tamaq_flutter/features/authentication/reset_password_page.dart';

class LogInPage extends StatefulWidget {
  final VoidCallback showRegisterTab;

  const LogInPage({super.key, required this.showRegisterTab});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                image: AssetImage(
                  'assets/images/Ornament.png',
                ),
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
                  accountMainTextStyle('Авторизоваться'),
                  const SizedBox(height: 30.0),
                  textFieldForm('Почта', Icons.email, false, _emailController),
                  const SizedBox(height: 15.0),
                  textFieldForm(
                      'Пароль', Icons.lock, true, _passwordController),
                  const SizedBox(height: 10),
                  forgetPassword(context),
                  const SizedBox(height: 20),
                  customButton(context, true, signIn),
                  signUpOption(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        accountSubTextStyle('Не зарегистрированы?'),
        const SizedBox(width: 3.0),
        TextButton(
          onPressed: widget.showRegisterTab,
          child: const Text(
            'Регистрация',
            style: TextStyle(
                color: Color(0xffE94D01), fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ResetPasswordPage();
          } ));
        },
        child: const Text(
          "Забыли пароль?",
          style: TextStyle(color: Colors.grey),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
