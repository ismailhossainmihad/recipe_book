import 'package:flutter/material.dart';
import 'recipe.dart';

class AddEditRecipeScreen extends StatefulWidget {
  final Recipe? recipe;

  AddEditRecipeScreen({this.recipe});

  @override
  _AddEditRecipeScreenState createState() => _AddEditRecipeScreenState();
}

class _AddEditRecipeScreenState extends State<AddEditRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _stepsController = TextEditingController();

  @override
  void initState() {
    if (widget.recipe != null) {
      _titleController.text = widget.recipe!.title;
      _descriptionController.text = widget.recipe!.description;
      _ingredientsController.text = widget.recipe!.ingredients.join(', ');
      _stepsController.text = widget.recipe!.steps.join(', ');
    }
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _ingredientsController.dispose();
    _stepsController.dispose();
    super.dispose();
  }

  void _saveRecipe() {
    if (_formKey.currentState!.validate()) {
      final newRecipe = Recipe(
        id: widget.recipe?.id ?? DateTime.now().toString(),
        title: _titleController.text,
        description: _descriptionController.text,
        ingredients: _ingredientsController.text.split(', '),
        steps: _stepsController.text.split(', '),
      );
      Navigator.pop(context, newRecipe);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe == null ? 'Add Recipe' : 'Edit Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ingredientsController,
                decoration:
                    InputDecoration(labelText: 'Ingredients (comma separated)'),
              ),
              TextFormField(
                controller: _stepsController,
                decoration:
                    InputDecoration(labelText: 'Steps (comma separated)'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveRecipe,
                child: Text('Save Recipe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
