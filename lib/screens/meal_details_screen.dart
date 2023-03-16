import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_ingredients.dart';
import 'package:meals_app/widgets/meal_steps.dart';

class MealDetailsScreen extends StatelessWidget {
  final Function toggleFavorites;
  final Function isFavorite;

  const MealDetailsScreen({
    super.key,
    required this.toggleFavorites,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere(
      (meal) => meal.id == mealId,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(mealId),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
            MealIngredients(
              selectedMealIngredientsLength: selectedMeal.ingredients.length,
              selectedMealIngredients: selectedMeal.ingredients,
            ),
            MealSteps(
              selectedMealStepsLength: selectedMeal.steps.length,
              selectedMealSteps: selectedMeal.steps,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorites(mealId),
      ),
    );
  }
}
