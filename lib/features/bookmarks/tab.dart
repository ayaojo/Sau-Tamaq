import 'package:flutter/material.dart';
import 'package:sau_tamaq_flutter/features/bookmarks/saved_recipe_list.dart';

class SavedTab extends StatelessWidget {
  final SavedRecipeList savedRecipeList;

  const SavedTab({
    super.key,
    required this.savedRecipeList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFEFEFE),
        surfaceTintColor: const Color(0xFFFEFEFE),
        centerTitle: true,
        title: const Text(
          'Сохранённые рецепты',
          style: TextStyle(
            color: Color(0xFF191919),
            fontWeight: FontWeight.bold,
            fontSize: 24,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      body: savedRecipeList,
    );
  }
}
