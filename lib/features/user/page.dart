import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/features/init/page.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello ${user.email}'),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const InitPage()),
                    (Route<dynamic> route) => false,
                  );
                });
              },
              child: const Text('log out'),
            ),
          ],
        ),
      ),
    );
  }
}
