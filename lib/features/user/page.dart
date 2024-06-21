import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              print('user sign out');
              Navigator.pushReplacementNamed(context, '/login');
            });
          },
          child: const Text('log out'),
        ),
      ),
    );
  }
}
