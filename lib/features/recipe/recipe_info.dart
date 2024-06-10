import 'package:flutter/material.dart';

class RecipeInfo extends StatelessWidget {
  final String recipeCardTitle;

  const RecipeInfo({super.key, required this.recipeCardTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeCardTitle),
      ),
      body: Center(
        child: Text('Details of $recipeCardTitle'), // Здесь отобразите подробную информацию о рецепте
      ),
    );
  }
}
