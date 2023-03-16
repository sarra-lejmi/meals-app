import 'package:flutter/material.dart';
import 'package:meals_app/consts/routes.dart';
import 'package:meals_app/widgets/list_tile_drawer.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.secondary,
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          ListTileDrawer(
            icon: Icons.restaurant,
            title: "Meals",
            tappedListTile: () => Navigator.of(context).pushReplacementNamed(tabsRoute),
          ),
          ListTileDrawer(
            icon: Icons.settings,
            title: "Filters",
            tappedListTile: () => Navigator.of(context).pushReplacementNamed(filtersRoute),
          ),
        ],
      ),
    );
  }
}
