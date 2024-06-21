import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sau_tamaq_flutter/common/reusable_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      backBtn(context),
                      const SizedBox(height: 150.0),
                      accountMainTextStyle('Регистрация'),
                      const SizedBox(height: 30.0),
                      textFieldForm('Имя пользователя', Icons.person, false,
                          _userNameController),
                      const SizedBox(height: 15.0),
                      textFieldForm(
                          'Почта', Icons.email, false, _emailController),
                      const SizedBox(height: 15.0),
                      textFieldForm(
                          'Пароль', Icons.lock, true, _passwordController),
                      const SizedBox(height: 20),
                      customButton(context, false, () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text)
                            .then((value) {
                          print('created new user');
                          Navigator.pushReplacementNamed(context, '/root');
                        }).onError((error, stackTrace) {
                          print('error ${error.toString()}');
                        });
                      }),
                      logInOption(),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Opacity(
                opacity: 0.45,
                child: SvgPicture.asset('assets/images/Ornament.svg'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row logInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        accountSubTextStyle('Уже есть аккаунт?'),
        const SizedBox(width: 8.0),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
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
