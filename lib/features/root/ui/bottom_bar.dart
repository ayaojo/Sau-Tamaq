
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: const Color(0xFF1D3557),
      onTap: (value) {
        DefaultTabController.of(context).animateTo(value);
        setState(() {
          currentIndex = value;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(UniconsLine.home_alt),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_outline),
          activeIcon: Icon(Icons.bookmark),
          label: 'Saved',
        ),
        BottomNavigationBarItem(
          icon: Icon(UniconsLine.user),
          label: 'Account',
        )
      ],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    );
  }
}