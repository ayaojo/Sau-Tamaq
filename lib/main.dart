import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/common/light_theme.dart';
import 'package:sau_tamaq_flutter/features/root/page.dart';

import 'features/init/page.dart';

void main() {
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
        
      },
      
    );
  }
}
