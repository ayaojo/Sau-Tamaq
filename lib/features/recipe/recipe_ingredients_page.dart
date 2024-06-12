import 'package:flutter/material.dart';

class RecipeIngredientsPage extends StatelessWidget {
  const RecipeIngredientsPage({super.key});

@override
Widget build(BuildContext context) {
    return  Center(
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
    );
  }
}