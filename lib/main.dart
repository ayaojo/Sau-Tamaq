import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/common/light_theme.dart';
import 'package:sau_tamaq_flutter/features/init/bon_appetit_page.dart';
import 'package:sau_tamaq_flutter/features/init/page.dart';
import 'package:sau_tamaq_flutter/features/root/page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB8-BujQGs8a6MF2MhlGOTk_wU-haB67ZY",
      appId: "1:571198134911:web:f9c03207a6ea05ee7c3d4a",
      messagingSenderId: "571198134911",
      projectId: "sau-tamaq-7d1ce",
    ),
  );

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
      },
    );
  }
}
