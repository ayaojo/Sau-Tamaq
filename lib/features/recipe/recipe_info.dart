import 'package:flutter/material.dart';

class RecipeInfo extends StatelessWidget {
  final String recipeCardTitle;
  final String recipeCardTime;
  final String recipeCardImg;
  final String recipeLevel;
  final String recipeCalories;
  final List<String> recipeIngredients;

  const RecipeInfo(
      {super.key,
      required this.recipeCardTitle,
      required this.recipeCardTime,
      required this.recipeCardImg,
      required this.recipeLevel,
      required this.recipeCalories,
      required this.recipeIngredients});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Рецепт'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              padding: const EdgeInsets.all(15.0),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(recipeCardImg),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6),
                    BlendMode.darken,
                  ),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipeCardTitle,
                    style: const TextStyle(
                      color: Color(0xFFFEFEFE),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
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
          const SizedBox(
            height: 35.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ингредиенты',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                DropdownMenu(
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
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recipeIngredients.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    recipeIngredients[index],
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                );
              },
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
