import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        child: GestureDetector(
            onTap: () {
              print("it's can move");
            },
            child: ListView.separated(
              separatorBuilder: (_, __) => const SizedBox(height: 14),
              itemCount: widget.items.length,
              scrollDirection: Axis.vertical,
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
                        BlendMode.softLight,
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
                          SvgPicture.asset('assets/icons/rec_icon_time.svg'),
                          Text(
                            item.recipeCardTime,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w100,
                                fontSize: 10),
                          )
                        ],
                      ),
                      Text(
                        item.recipeCardTitle,
                        style: const TextStyle(
                          color: Color(0xFFFEFEFE),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                );
              },
            )));
  }
}

class RecipeCard {
  final String recipeCardTitle;
  final String recipeCardTime;
  final String recipeCardImg;
  final bool isBookmark;

  const RecipeCard(this.recipeCardTitle, this.recipeCardTime,
      this.recipeCardImg, this.isBookmark);
}
