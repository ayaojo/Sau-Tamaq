import 'package:flutter/material.dart';

class RecipeStepsPage extends StatelessWidget {
  const RecipeStepsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/end');
        },
        child: const Text(
          'Завершить',
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

