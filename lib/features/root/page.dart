import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const Center(
          child: Text('Root Page'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.home_alt),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.bookmark),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.user),
              label: 'Acount',
            )
          ],
        )
      );
  }
}
