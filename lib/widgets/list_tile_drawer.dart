import 'package:flutter/material.dart';

class ListTileDrawer extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback tappedListTile;

  const ListTileDrawer({
    super.key,
    required this.icon,
    required this.title,
    required this.tappedListTile
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tappedListTile,
    );
  }
}
