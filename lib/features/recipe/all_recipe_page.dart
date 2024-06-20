import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/common/recipe_cards.dart';

class AllRecipesPage extends StatelessWidget {
  final List<RecipeCard> allRecipes;

  const AllRecipesPage({super.key, required this.allRecipes});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<RecipeCard>> savedRecipes = ValueNotifier([]);

    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      appBar: AppBar(
        title: const Text('Все рецепты'),
        backgroundColor: const Color(0xFFFEFEFE),
        surfaceTintColor: const Color(0xFFFEFEFE),
      ),
      body: Column(
        children: [
          RecipeCards(
            items: allRecipes,
            savedRecipes: savedRecipes,
          ),
        ],
      ),
    );
  }
}
