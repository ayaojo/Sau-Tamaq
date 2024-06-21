import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sau_tamaq_flutter/common/reusable_widgets.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  
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
                      accountMainTextStyle('Сброс пароля'),
                      const SizedBox(height: 30.0),
                      textFieldForm(
                          'Почта', Icons.email, false, _emailController),
                      const SizedBox(height: 20),
                      customButton(context, true, () {
                        FirebaseAuth.instance
                            .sendPasswordResetEmail(
                                email: _emailController.text)
                            .then((value) {
                          Navigator.of(context).pop();
                        }).onError((error, stackTrace) {
                          print('error ${error.toString()}');
                        });
                      }),
                      //signUpOption(),
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
}
