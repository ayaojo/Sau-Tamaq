import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/features/recipe/recipe_info.dart';

class RecipeCards extends StatefulWidget {
  final List<RecipeCard> items;
  final ValueNotifier<List<RecipeCard>> savedRecipes;

  const RecipeCards({
    super.key,
    required this.items,
    required this.savedRecipes,
  });

  @override
  State<RecipeCards> createState() => _RecipeCardsState();
}

class _RecipeCardsState extends State<RecipeCards> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemCount: widget.items.length,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        itemBuilder: (context, index) {
          final item = widget.items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeInfo(
                    recipeCardTitle: item.recipeCardTitle,
                    recipeCardImg: item.recipeCardImg,
                    recipeCardTime: item.recipeCardTime,
                    recipeLevel: item.recipeLevel,
                    recipeCalories: item.recipeCalories,
                    recipeIngredients: item.recipeIngredients,
                    recipeCookSteps: item.recipeCookSteps,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(15.0),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item.recipeCardImg),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6),
                    BlendMode.darken,
                  ),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.access_time_outlined,
                                    color: Colors.white70, size: 12),
                                const SizedBox(width: 4.0),
                                Text(
                                  '${item.recipeCardTime} мин',
                                  style: const TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                )
                              ],
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              item.recipeCardTitle,
                              style: const TextStyle(
                                color: Color(0xFFFEFEFE),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: Icon(
                          item.isBookmark
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            item.isBookmark = !item.isBookmark;
                            if (item.isBookmark) {
                              widget.savedRecipes.value.add(item);
                            } else {
                              widget.savedRecipes.value.remove(item);
                            }
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class RecipeCard {
  final String recipeCardTitle;
  final String recipeCardTime;
  final String recipeCardImg;
  bool isBookmark;
  final String category;
  final String recipeLevel;
  final String recipeCalories;
  final Map<String, String> recipeIngredients;
  final Map<String, String> recipeCookSteps;

  RecipeCard(
    this.recipeCardTitle,
    this.recipeCardTime,
    this.recipeCardImg,
    this.isBookmark,
    this.category,
    this.recipeLevel,
    this.recipeCalories,
    this.recipeIngredients,
    this.recipeCookSteps,
  );
}
