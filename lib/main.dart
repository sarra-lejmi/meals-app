import 'package:flutter/material.dart';
import 'package:meals_app/consts/routes.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegetarian": false,
    "vegan": false,
  };

  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(
      () {
        _filters = filterData;
        _availableMeals = dummyMeals.where((meal) {
          if (_filters["gluten"]! && !meal.isGlutenFree) return false;
          if (_filters["lactose"]! && !meal.isLactoseFree) return false;
          if (_filters["vegetarian"]! && !meal.isVegetarian) return false;
          if (_filters["vegan"]! && !meal.isVegan) return false;
          return true;
        }).toList();
      },
    );
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(
        () {
          _favoriteMeals.removeAt(existingIndex);
        },
      );
    } else {
      setState(
        () {
          _favoriteMeals.add(
            dummyMeals.firstWhere((meal) => meal.id == mealId),
          );
        },
      );
    }
  }

  bool _isMealFavorite(String id) =>
      _favoriteMeals.any((meal) => meal.id == id);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.pink,
        ),
        primarySwatch: Colors.pink,
        colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleLarge: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RobotoCondensed"),
            ),
      ),
      // home: const CategoriesScreen(),
      // home: const TabsScreen(),
      initialRoute: tabsRoute,
      routes: {
        categoryMealsRoute: (context) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        mealDetailsRoute: (context) => MealDetailsScreen(
              toggleFavorites: _toggleFavorite,
              isFavorite: _isMealFavorite,
            ),
        tabsRoute: (context) => TabsScreen(favoriteMeals: _favoriteMeals),
        filtersRoute: (context) => FiltersScreen(
              currentFilters: _filters,
              saveFilters: _setFilters,
            ),
      },
    );
  }
}
