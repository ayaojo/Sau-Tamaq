import 'package:flutter/material.dart';

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
          return Container(
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
                    Column(
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
                                  fontSize: 10),
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
                        ),
                      ],
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
                            widget.savedRecipes.value.remove(
                                item); // Удаление из списка сохраненных рецептов
                          }
                          // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                          widget.savedRecipes.notifyListeners();
                        });
                      },
                    ),
                  ),
                )
              ],
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

  RecipeCard(
    this.recipeCardTitle,
    this.recipeCardTime,
    this.recipeCardImg,
    this.isBookmark,
    this.category,
  );
}
