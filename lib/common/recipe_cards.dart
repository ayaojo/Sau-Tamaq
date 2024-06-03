import 'package:flutter/material.dart';

class RecipeCards extends StatefulWidget {
  final List<RecipeCard> items;
  const RecipeCards({
    super.key,
    required this.items,
  });

  @override
  State<RecipeCards> createState() => _RecipeCardsState();
}

class _RecipeCardsState extends State<RecipeCards> {
  bool isBookmark = false;

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.access_time_outlined, color: Colors.white70, size: 12),
                    const SizedBox(width: 4.0),
                    Text(
                      '${item.recipeCardTime} мин',
                      style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.w400, fontSize: 10),
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
  final bool isBookmark;
  final String category;

  const RecipeCard(
    this.recipeCardTitle,
    this.recipeCardTime,
    this.recipeCardImg,
    this.isBookmark,
    this.category,
  );
}
