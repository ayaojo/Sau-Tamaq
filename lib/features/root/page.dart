import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/common/recipe_cards.dart';
import 'package:sau_tamaq_flutter/features/bookmarks/saved_recipe_list.dart';
import 'package:sau_tamaq_flutter/features/bookmarks/tab.dart';
import 'package:sau_tamaq_flutter/features/home/tab.dart';
import 'package:sau_tamaq_flutter/features/root/bottom_bar.dart';
import 'package:sau_tamaq_flutter/features/user/page.dart';

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
              const UserPage(),
            ]),
        bottomNavigationBar: const BottomNav(),
      ),
    );
  }
}

