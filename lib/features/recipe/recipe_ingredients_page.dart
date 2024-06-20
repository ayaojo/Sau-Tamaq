import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/common/recipe_image_block.dart';
import 'package:sau_tamaq_flutter/features/recipe/recipe_info.dart';
import 'package:sau_tamaq_flutter/features/recipe/recipe_steps_page.dart';

class RecipeIngredientsPage extends StatefulWidget {
  final String recipeCardTitle;
  final String recipeCardImg;
  final Map<String, String> recipeIngredients;
  final Map<String, String> recipeCookSteps;
  final int servings;

  const RecipeIngredientsPage({
    super.key,
    required this.recipeCardTitle,
    required this.recipeCardImg,
    required this.recipeIngredients,
    required this.recipeCookSteps,
    required this.servings,
  });

  @override
  State<RecipeIngredientsPage> createState() => _RecipeIngredientsPageState();
}

class _RecipeIngredientsPageState extends State<RecipeIngredientsPage> {
  Map<String, String> _scaleIngredients(
      Map<String, String> ingredients, int scale) {
    return ingredients.map((key, value) {
      final quantity = _parseQuantity(value);
      final scaledQuantity = quantity * scale;
      return MapEntry(key, _formatQuantity(scaledQuantity, value));
    });
  }

  double _parseQuantity(String quantity) {
    final match = RegExp(r'(\d+(\.\d+)?)').firstMatch(quantity);
    return match != null ? double.parse(match[0]!) : 1.0;
  }

  String _formatQuantity(double quantity, String original) {
    return original.replaceFirst(RegExp(r'(\d+(\.\d+)?)'), quantity.toString());
  }

  @override
  Widget build(BuildContext context) {
    final scaledIngredients =
        _scaleIngredients(widget.recipeIngredients, widget.servings);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RecipeImageBlock(
                recipeImage: widget.recipeCardImg,
                recipeName: widget.recipeCardTitle,
              ),
              const SizedBox(height: 12),
              const Text(
                'Пожалуйста, подготовьте ингредиенты перед началом приготовления',
                style: TextStyle(fontSize: 16),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: scaledIngredients.length,
                itemBuilder: (context, index) {
                  final ingredient = scaledIngredients.entries.elementAt(index);
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: RecipeIngredientList(
                        recipeIngredientName: ingredient.key,
                        recipeIngredientQuantity: ingredient.value,
                        showCheckbox: true,
                      ),
                    ),
                  );
                },
              ),
              Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeStepsPage(
                          recipeCardTitle: widget.recipeCardTitle,
                          recipeCardImg: widget.recipeCardImg,
                          recipeCookSteps: widget.recipeCookSteps,
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
      ),
    );
  }
}
