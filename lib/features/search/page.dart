import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/common/recipe_cards.dart';

class SearchTab extends SearchDelegate<RecipeCard?> {
  final List<RecipeCard> allRecipes;

  SearchTab(this.allRecipes);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear_rounded),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var results = allRecipes
        .where((recipe) =>
            recipe.recipeCardTitle.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        var recipe = results[index];
        return ListTile(
          title: Text(recipe.recipeCardTitle),
          subtitle: Text(recipe.category),
          onTap: () {
            close(context, recipe);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestions = allRecipes
        .where((recipe) =>
            recipe.recipeCardTitle.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        var recipe = suggestions[index];
        return ListTile(
          title: Text(recipe.recipeCardTitle),
          subtitle: Text(recipe.category),
          onTap: () {
            query = recipe.recipeCardTitle;
            showResults(context);
          },
        );
      },
    );
  }
}
