import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingredients:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            for (var ingredient in recipe.ingredients) Text(ingredient),
            SizedBox(height: 20),
            Text('Steps:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            for (var step in recipe.steps) Text(step),
          ],
        ),
      ),
    );
  }
}
