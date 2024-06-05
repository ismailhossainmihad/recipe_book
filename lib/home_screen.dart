import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_card.dart';
import 'add_edit_recipe_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Recipe> _recipes = [
    Recipe(
      id: '1',
      title: 'Spaghetti Carbonara',
      description: 'A classic Italian pasta dish.',
      ingredients: [
        'Spaghetti',
        'Eggs',
        'Pancetta',
        'Parmesan cheese',
        'Pepper'
      ],
      steps: [
        'Boil pasta',
        'Fry pancetta',
        'Mix eggs and cheese',
        'Combine all'
      ],
    ),
    // Add more recipes here
  ];

  void _addRecipe(Recipe recipe) {
    setState(() {
      _recipes.add(recipe);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Book'),
      ),
      body: ListView.builder(
        itemCount: _recipes.length,
        itemBuilder: (ctx, index) {
          return RecipeCard(recipe: _recipes[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newRecipe = await Navigator.push<Recipe>(
            context,
            MaterialPageRoute(builder: (context) => AddEditRecipeScreen()),
          );
          if (newRecipe != null) {
            _addRecipe(newRecipe);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
