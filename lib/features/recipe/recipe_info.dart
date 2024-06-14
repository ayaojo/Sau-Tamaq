import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/common/recipe_image_block.dart';
import 'package:sau_tamaq_flutter/features/recipe/recipe_ingredients_page.dart';

class RecipeInfo extends StatelessWidget {
  final String recipeCardTitle;
  final String recipeCardTime;
  final String recipeCardImg;
  final String recipeLevel;
  final String recipeCalories;
  final Map<String, String> recipeIngredients;
  final Map<String, String> recipeCookSteps;

  const RecipeInfo({
    super.key,
    required this.recipeCardTitle,
    required this.recipeCardTime,
    required this.recipeCardImg,
    required this.recipeLevel,
    required this.recipeCalories,
    required this.recipeIngredients,
    required this.recipeCookSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Рецепт'),
        backgroundColor: const Color(0xFFFEFEFE),
        surfaceTintColor: const Color(0xFFFEFEFE),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: RecipeImageBlock(
              recipeImage: recipeCardImg,
              recipeName: recipeCardTitle,
            ),
          ),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              decoration: BoxDecoration(
                color: const Color(0xFFD2E7FF),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RecipeInfoWidget(
                    widgetIcon: Icons.local_fire_department,
                    mainText: recipeCalories,
                    subText: 'Калории',
                  ),
                  RecipeInfoWidget(
                    widgetIcon: Icons.access_time_filled,
                    mainText: '$recipeCardTime мин',
                    subText: 'Время',
                  ),
                  RecipeInfoWidget(
                    widgetIcon: Icons.star_rounded,
                    mainText: recipeLevel,
                    subText: 'Сложность',
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 35.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: const DropdownMenu(
              label: Text('Порция'),
              width: 140.0,
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 1, label: '1'),
                DropdownMenuEntry(value: 2, label: '2'),
                DropdownMenuEntry(value: 3, label: '3'),
                DropdownMenuEntry(value: 4, label: '4'),
                DropdownMenuEntry(value: 5, label: '5'),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0),
                  child: Text(
                    'Ингредиенты',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                ...recipeIngredients.entries.map((ingredient) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 4.0),
                    child: RecipeIngredientList(
                      recipeIngredientName: ingredient.key,
                      recipeIngredientQuantity: ingredient.value,
                    ),
                  );
                }),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0),
                  child: Text(
                    'Инструкции',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                ...recipeCookSteps.entries.map((step) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 6.0),
                    child: RecipeStepList(
                      recipeStepNum: step.key,
                      recipeStepDescription: step.value,
                    ),
                  );
                }),
              ],
            ),
          ),
          SafeArea(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeIngredientsPage(
                      recipeCardTitle: recipeCardTitle,
                      recipeCardImg: recipeCardImg,
                      recipeIngredients: recipeIngredients, recipeCookSteps: recipeCookSteps,
                    ),
                  ),
                );
              },
              child: const Text(
                'Начнём готовить',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecipeInfoWidget extends StatelessWidget {
  final IconData widgetIcon;
  final String mainText;
  final String subText;

  const RecipeInfoWidget({
    super.key,
    required this.widgetIcon,
    required this.mainText,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(widgetIcon),
        const SizedBox(height: 8.0),
        Text(
          mainText,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          subText,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class RecipeIngredientList extends StatelessWidget {
  final String recipeIngredientName;
  final String recipeIngredientQuantity;

  const RecipeIngredientList(
      {super.key,
      required this.recipeIngredientName,
      required this.recipeIngredientQuantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xffD2E7FF),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(recipeIngredientName,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          Text(recipeIngredientQuantity,
              style: const TextStyle(fontSize: 12, color: Color(0xff7E7E7E))),
        ],
      ),
    );
  }
}

class RecipeStepList extends StatelessWidget {
  final String recipeStepNum;
  final String recipeStepDescription;

  const RecipeStepList({
    super.key,
    required this.recipeStepNum,
    required this.recipeStepDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xffD2E7FF),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: [
          Text(
            recipeStepNum,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Text(
              recipeStepDescription,
              style: const TextStyle(
                fontSize: 14,
              ),
              maxLines: 15,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
