import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/common/recipe_image_block.dart';

class RecipeIngredientsPage extends StatelessWidget {

  const RecipeIngredientsPage({
    super.key,
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: RecipeImageBlock(
                recipeImage: 'recipeCardImg',
                recipeName: 'recipeCardTitle',
              ),
            ),
            const Text(
              'Пожалуйста, подготовьте ингредиенты перед началом приготовления',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),

            // Список ингредиентов
            
            // Конец списка ингредиентов

            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/steps');
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
