import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/features/home/tab.dart';
import 'package:sau_tamaq_flutter/features/recipe/recipe_info.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Результаты поиска'),
      ),
      body: ListView.builder(
        itemCount: allRecipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(allRecipes[index].recipeCardTitle),
            subtitle: Text(allRecipes[index].recipeCardTime),
            leading: CircleAvatar(
              backgroundImage: AssetImage(allRecipes[index].recipeCardImg),
            ),
            onTap: () {
              // При нажатии на рецепт происходит навигация на страницу RecipeInfo
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeInfo(
                    recipeCardTitle: allRecipes[index].recipeCardTitle,
                    recipeCardTime: allRecipes[index].recipeCardTime,
                    recipeCardImg: allRecipes[index].recipeCardImg,
                    recipeLevel: allRecipes[index].recipeLevel,
                    recipeCalories: allRecipes[index].recipeCalories,
                    recipeIngredients: allRecipes[index].recipeIngredients,
                    recipeCookSteps: allRecipes[index].recipeCookSteps,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:sau_tamaq_flutter/common/recipe_cards.dart';
// import 'package:sau_tamaq_flutter/features/home/tab.dart';

// class SearchTab extends SearchDelegate<RecipeCard?> {
//   SearchTab(List<RecipeCard> allRecipes);

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = '';
//           },
//           icon: const Icon(Icons.clear_rounded))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     var results = allRecipes
//         .where((recipe) =>
//             recipe.recipeCardTitle.toLowerCase().contains(query.toLowerCase()))
//         .toList();

//     return ListView.builder(
//       itemCount: results.length,
//       itemBuilder: (context, index) {
//         var recipe = results[index];
//         return ListTile(
//           title: Text(recipe.recipeCardTitle),
//           subtitle: Text(recipe.category),
//           onTap: () {
//             close(context, recipe);
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     var suggestions = allRecipes
//         .where((recipe) =>
//             recipe.recipeCardTitle.toLowerCase().contains(query.toLowerCase()))
//         .toList();

//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         var recipe = suggestions[index];
//         return ListTile(
//           title: Text(recipe.recipeCardTitle),
//           subtitle: Text(recipe.category),
//           onTap: () {
//             query = recipe.recipeCardTitle;
//             showResults(context);
//           },
//         );
//       },
//     );
//   }
// }