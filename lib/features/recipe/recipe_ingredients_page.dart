import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/common/recipe_image_block.dart';
import 'package:sau_tamaq_flutter/features/recipe/recipe_info.dart';
import 'package:sau_tamaq_flutter/features/recipe/recipe_steps_page.dart';

class RecipeIngredientsPage extends StatelessWidget {
  final String recipeCardTitle;
  final String recipeCardImg;
  final Map<String, String> recipeIngredients;
  final Map<String, String> recipeCookSteps;

  const RecipeIngredientsPage({
    super.key,
    required this.recipeCardTitle,
    required this.recipeCardImg,
    required this.recipeIngredients,
    required this.recipeCookSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ингредиенты', style: TextStyle(fontSize: 20)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: const Color(0xFFFEFEFE),
        surfaceTintColor: const Color(0xFFFEFEFE),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecipeImageBlock(
              recipeImage: recipeCardImg,
              recipeName: recipeCardTitle,
            ),
            const SizedBox(height: 12),
            const Text(
              'Пожалуйста, подготовьте ингредиенты перед началом приготовления',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: recipeIngredients.length,
                itemBuilder: (context, index) {
                  final ingredient = recipeIngredients.entries.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: RecipeIngredientList(
                      recipeIngredientName: ingredient.key,
                      recipeIngredientQuantity: ingredient.value,
                      showCheckbox: true,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeStepsPage(
                        recipeCardTitle: recipeCardTitle,
                        recipeCardImg: recipeCardImg,
                        recipeCookSteps: recipeCookSteps,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Дальше',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
