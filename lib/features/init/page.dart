import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../root/page.dart';


class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(width: double.infinity),
            const Spacer(flex: 2,),
            SvgPicture.asset('assets/images/welcome-logo-ph.svg'),
            const Spacer(),
            SafeArea(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RootPage(),
                    ));
                  },
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(Color(0xff1D3557)),
                    foregroundColor: const WidgetStatePropertyAll(Color(0xffFEFEFE)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                    padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 25.0, horizontal: 60.0))
                  ),
                  
                  child: const Text('Давайте начнем!')
                ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
