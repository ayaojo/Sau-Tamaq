import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/common/recipe_cards.dart';
import 'package:sau_tamaq_flutter/features/home/tab.dart';

class SavedRecipeList extends StatelessWidget {
  final ValueNotifier<List<RecipeCard>> savedRecipes;

  const SavedRecipeList({super.key, required this.savedRecipes});

  @override
  Widget build(BuildContext context) {
    return RecipeCards(
        items:
            allRecepies.where((element) => element.isBookmark == true).toList(),
        savedRecipes: savedRecipes);
  }
}
