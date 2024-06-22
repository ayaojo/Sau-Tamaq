import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sau_tamaq_flutter/features/authentication/main_page.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Column(
          children: [
            const Spacer(flex: 2),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 315),
              child: SvgPicture.asset(
                'assets/images/welcome-logo-ph.svg',
              ),
            ),
            const Spacer(),
            SafeArea(
              child: ElevatedButton(
                child: Text(
                  'Давайте начнем!',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                  );
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
