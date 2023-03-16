import 'package:flutter/material.dart';

class MealSteps extends StatelessWidget {
  final int selectedMealStepsLength;
  final List<String> selectedMealSteps;
  const MealSteps({
    super.key,
    required this.selectedMealStepsLength,
    required this.selectedMealSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "Steps",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
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
            itemCount: selectedMealStepsLength,
            itemBuilder: (context, index) => Column(
              children: [
                ListTile(
                  leading: CircleAvatar(child: Text("# ${index + 1}")),
                  title: Text(selectedMealSteps[index]),
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
