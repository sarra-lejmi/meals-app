import 'package:flutter/material.dart';
import 'package:meals_app/consts/routes.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(
      {super.key, required this.id, required this.title, required this.color});

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      categoryMealsRoute,
      arguments: {
        "id": id,
        "title": title,
      },
    );
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) =>
    //         CategoryMealsScreen(categoryId: id, categoryTitle: title),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
