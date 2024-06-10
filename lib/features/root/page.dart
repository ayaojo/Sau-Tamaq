import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/common/recipe_cards.dart';
import 'package:sau_tamaq_flutter/features/bookmarks/saved_recipe_list.dart';
import 'package:sau_tamaq_flutter/features/bookmarks/tab.dart';
import 'package:sau_tamaq_flutter/features/home/tab.dart';
import 'package:unicons/unicons.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final savedRecipes = ValueNotifier(<RecipeCard>[]);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const HomeTab(),
              SavedTab(
                  savedRecipeList: SavedRecipeList(savedRecipes: savedRecipes)),
              const Text('data3'),
            ]),
        bottomNavigationBar: const _BottomNav(),
      ),
    );
  }
}

class _BottomNav extends StatefulWidget {
  const _BottomNav();

  @override
  State<_BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<_BottomNav> {
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
          icon: Icon(UniconsLine.bookmark),
          activeIcon: Icon(UniconsLine.),
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
