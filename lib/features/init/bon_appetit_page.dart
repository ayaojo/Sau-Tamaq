import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BonAppetitPage extends StatelessWidget {
  const BonAppetitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 315),
                child: SvgPicture.asset(
                  'assets/images/logo_bonappetit.svg',
                ),
              ),
              const Spacer(flex: 1),
              Text(
                'Приятного аппетита!',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(flex: 1),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/root');
                },
                child: Text(
                  'Спасибо!',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
