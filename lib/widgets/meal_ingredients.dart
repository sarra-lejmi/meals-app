import 'package:flutter/material.dart';

class MealIngredients extends StatelessWidget {
  final int selectedMealIngredientsLength;
  final List<String> selectedMealIngredients;

  const MealIngredients({
    super.key,
    required this.selectedMealIngredientsLength,
    required this.selectedMealIngredients,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "Ingredients",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: 300,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(15)),
          child: ListView.builder(
            itemCount: selectedMealIngredientsLength,
            itemBuilder: (context, index) => Card(
              color: Theme.of(context).colorScheme.secondary,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(selectedMealIngredients[index]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
