import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/common/recipe_image_block.dart';
import 'package:sau_tamaq_flutter/features/recipe/recipe_info.dart';

class RecipeStepsPage extends StatelessWidget {
  final String recipeCardTitle;
  final String recipeCardImg;
  final Map<String, String> recipeCookSteps;

  const RecipeStepsPage({
    super.key,
    required this.recipeCardTitle,
    required this.recipeCardImg,
    required this.recipeCookSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Шаги приготовления', style: TextStyle(fontSize: 20)),
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
              'Выполните следующие действия, чтобы приготовить этот рецепт',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: recipeCookSteps.length,
                itemBuilder: (context, index) {
                  final step = recipeCookSteps.entries.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: RecipeStepList(
                      recipeStepNum: step.key,
                      recipeStepDescription: step.value,
                      showCheckbox: true,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: SafeArea(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/end');
                  },
                  child: const Text(
                    'Завершить',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
