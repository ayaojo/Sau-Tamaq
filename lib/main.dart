import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/common/light_theme.dart';
import 'package:sau_tamaq_flutter/features/authentication/reset_password_page.dart';
import 'package:sau_tamaq_flutter/features/init/bon_appetit_page.dart';
import 'package:sau_tamaq_flutter/features/init/page.dart';
import 'package:sau_tamaq_flutter/features/authentication/log_in_page.dart';
import 'package:sau_tamaq_flutter/features/authentication/sign_up_page.dart';
import 'package:sau_tamaq_flutter/features/root/page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyB8-BujQGs8a6MF2MhlGOTk_wU-haB67ZY",
          appId: "1:571198134911:web:f9c03207a6ea05ee7c3d4a",
          messagingSenderId: "571198134911",
          projectId: "sau-tamaq-7d1ce"),
    );
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sau Tamaq',
      theme: lightTheme,
      routes: {
        '/': (context) => const InitPage(),
        '/root': (context) => const RootPage(),
        '/end': (context) => const BonAppetitPage(),
        '/login': (context) => const LogInPage(),
        '/signup': (context) => const SignUpPage(),
        '/reset_password': (context) => const ResetPasswordPage(),
      },
    );
  }
}
