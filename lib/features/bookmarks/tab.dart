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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Bookmarks'),
      ),
      body: savedRecipeList,
    );
  }
}
