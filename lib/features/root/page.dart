import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/features/bookmarks/tab.dart';
import 'package:sau_tamaq_flutter/features/home/tab.dart';
import 'package:unicons/unicons.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeTab(),
              SavedTab(),
              Text('data3'),
            ],
          ),
          bottomNavigationBar: _BottomNav()),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF1D3557),
      onTap: (value) {
        DefaultTabController.of(context).animateTo(value);
      },
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
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    );
  }
}
