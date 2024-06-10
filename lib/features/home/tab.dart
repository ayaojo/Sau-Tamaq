import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/common/choice_chips.dart';
import 'package:sau_tamaq_flutter/common/recipe_cards.dart';
import 'package:unicons/unicons.dart';

var allRecepies = [
  RecipeCard(
    'Завтрак 1',
    '12.3',
    'assets/images/recipe_photo3.png',
    false,
    "завтрак",
  ),
    RecipeCard(
    'Завтрак 2',
    '12.3',
    'assets/images/recipe_photo3.png',
    false,
    "завтрак",
  ),
  RecipeCard(
    'Обед 1',
    '30',
    'assets/images/recipe_photo2.png',
    true,
    "обед",
  ),
  RecipeCard(
    'Ужин 1',
    '12.3',
    'assets/images/recipe_photo1.png',
    true,
    "ужин",
  ),
  RecipeCard(
    'Десерт 1',
    '30',
    'assets/images/recipe_photo2.png',
    false,
    "десерт",
  ),
  RecipeCard(
    'Десерт 2',
    '12.3',
    'assets/images/recipe_photo3.png',
    false,
    'десерт',
  ),
  RecipeCard(
    'Завтрак 3',
    '30',
    'assets/images/recipe_photo1.png',
    false,
    'завтрак',
  ),
];

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    print('build HomeTab');

    final savedRecipes = ValueNotifier(<RecipeCard>[]);
    final controller = ValueNotifier('завтрак');

    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFEFEFE),
        surfaceTintColor: const Color(0xFFFEFEFE),
        actions: [
          IconButton(
            icon: const Icon(UniconsLine.search),
            onPressed: () {
              showSearch(context: context, delegate: MySearchBar());
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text('Что ты хочешь приготовить сегодня?',
                textAlign: TextAlign.start,
                maxLines: 2,
                style: TextStyle(
                  color: Color(0xFF191919),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  overflow: TextOverflow.ellipsis,
                  letterSpacing: -0.04,
                )),
          ),
          const SizedBox(height: 24),
          ChoiceChips(
            items: const [
              ChipBtn('завтрак', 'assets/icons/breakfast.png'),
              ChipBtn('обед', 'assets/icons/lunch.png'),
              ChipBtn('ужин', 'assets/icons/dinner.png'),
              ChipBtn('десерт', 'assets/icons/dessert.png'),
              ChipBtn('салат', 'assets/icons/salad.png'),
              ChipBtn('закуски', 'assets/icons/snacks.png'),
            ],
            onSelected: (title) {
              controller.value = title;
            },
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 12, 0),
            child: Row(
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
          ),
          ValueListenableBuilder(
            valueListenable: controller,
            builder: (context, value, child) {
              return RecipeCards(
                items: allRecepies
                    .where((element) => element.category == value)
                    .toList(),
                savedRecipes: savedRecipes,
              );
            },
          ),
        ],
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
