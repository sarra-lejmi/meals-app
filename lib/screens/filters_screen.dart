import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/widgets/switch_list_tile_widget.dart';

class FiltersScreen extends StatefulWidget {
  final Map<String, bool> currentFilters;
  final Function(Map<String, bool>) saveFilters;

  const FiltersScreen({
    super.key,
    required this.currentFilters,
    required this.saveFilters,
  });

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegetarian = false;
  var _isVegan = false;

  @override
  void initState() {
    _isGlutenFree = widget.currentFilters["gluten"]!;
    _isLactoseFree = widget.currentFilters["lactose"]!;
    _isVegetarian = widget.currentFilters["vegetarian"]!;
    _isVegan = widget.currentFilters["vegan"]!;
    super.initState();
  }

  // Widget _buildSwitchListTile(String title, String description, bool value,
  //     Function(bool) updateValue) {
  //   return SwitchListTile(
  //     title: Text(title),
  //     value: value,
  //     subtitle: Text(description),
  //     onChanged: updateValue,
  //   );
  // }

  // void update(bool newValue, bool filterVar) {
  //   setState(() {
  //     filterVar = newValue;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                "gluten": _isGlutenFree,
                "lactose": _isLactoseFree,
                "vegetarian": _isVegetarian,
                "vegan": _isVegan,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTileWidget(
                  title: "Gluten-free",
                  description: "Only include gluten-free meals.",
                  value: _isGlutenFree,
                  updateValue: (newValue) {
                    setState(
                      () {
                        _isGlutenFree = newValue;
                      },
                    );
                  },
                ),
                SwitchListTileWidget(
                  title: "Lactose-free",
                  description: "Only include lactose-free meals.",
                  value: _isLactoseFree,
                  updateValue: (newValue) {
                    setState(
                      () {
                        _isLactoseFree = newValue;
                      },
                    );
                  },
                ),
                SwitchListTileWidget(
                  title: "Vegetarian",
                  description: "Only include vegetarian meals.",
                  value: _isVegetarian,
                  updateValue: (newValue) {
                    setState(
                      () {
                        _isVegetarian = newValue;
                      },
                    );
                  },
                ),
                SwitchListTileWidget(
                  title: "Vegan",
                  description: "Only include vegan meals.",
                  value: _isVegan,
                  updateValue: (newValue) {
                    setState(
                      () {
                        _isVegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
