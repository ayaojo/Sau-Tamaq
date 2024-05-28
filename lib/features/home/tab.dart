import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/common/choice_chips.dart';
import 'package:sau_tamaq_flutter/common/recipe_cards.dart';
import 'package:unicons/unicons.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFEFEFE),
        actions: [
          IconButton(
            icon: const Icon(UniconsLine.search),
            onPressed: () {
              showSearch(context: context, delegate: MySearchBar());
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Что ты хочешь приготовить сегодня?',
                textAlign: TextAlign.start,
                maxLines: 2,
                style: TextStyle(
                  color: Color(0xFF191919),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  overflow: TextOverflow.ellipsis,
                  letterSpacing: -0.04,
                )),
            const ChoiceChips(items: [
              ChipBtn('завтрак', 'assets/icons/breakfast.png'),
              ChipBtn('обед', 'assets/icons/lunch.png'),
              ChipBtn('ужин', 'assets/icons/dinner.png'),
              ChipBtn('десерт', 'assets/icons/dessert.png'),
              ChipBtn('салат', 'assets/icons/salad.png'),
              ChipBtn('закуски', 'assets/icons/snacks.png'),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Популярные рецепты',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF191919),
                    fontSize: 18,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    print("it's work");
                  },
                  child: const Text(
                    'все',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const RecipeCards(
              items: [
                RecipeCard(
                    'Cake', '12.3', 'assets/images/recipe_photo3.png', false),
                RecipeCard(
                    'Ramen', '30 min', 'assets/images/recipe_photo2.png', true),
                RecipeCard(
                    'Cake', '12.3', 'assets/images/recipe_photo1.png', true),
                RecipeCard('Ramen', '30 min', 'assets/images/recipe_photo2.png',
                    false),
                RecipeCard(
                    'Cake', '12.3', 'assets/images/recipe_photo3.png', false),
                RecipeCard('Ramen', '30 min', 'assets/images/recipe_photo1.png',
                    false),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MySearchBar extends SearchDelegate {
  List<String> allData = ['dessert', 'Apple Pie', 'Chocolate Cake', 'Ramen'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(UniconsLine.x))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          UniconsLine.angle_left_b,
          color: Colors.black,
        ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
