import 'package:flutter/material.dart';

class RecipeIngredientsPage extends StatelessWidget {
  final Map<String, String> recipeIngredients;

  const RecipeIngredientsPage({super.key, required this.recipeIngredients});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEFEFE),
        surfaceTintColor: const Color(0xFFFEFEFE),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ингредиенты',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const Text(
                'Пожалуйста, подготовьте ингредиенты перед началом приготовления',
                style: TextStyle(fontSize: 16)),
            ListView.builder(
              itemCount: recipeIngredients.length,
              itemBuilder: (context, index) {
                var ingredient = recipeIngredients.entries.elementAt(index);
                return RecipeIngredientList(
                  recipeIngredientName: ingredient.key,
                  recipeIngredientQuantity: ingredient.value,
                );
              },
            ),
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

class RecipeIngredientList extends StatefulWidget {
  final String recipeIngredientName;
  final String recipeIngredientQuantity;

  const RecipeIngredientList({
    super.key,
    required this.recipeIngredientName,
    required this.recipeIngredientQuantity,
  });

  @override
  State<StatefulWidget> createState() => _RecipeIngredientListState();
}

class _RecipeIngredientListState extends State<RecipeIngredientList> {
  bool isChecked = false;

  void _toggleCheckBox() {
    setState(() {
      isChecked = !isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheckBox,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: isChecked ? Colors.amber : const Color(0xffD2E7FF),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Text(
          widget.recipeIngredientName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: isChecked ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
