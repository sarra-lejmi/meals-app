import 'package:flutter/material.dart';

class SwitchListTileWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool value;
  final Function(bool) updateValue;

  const SwitchListTileWidget({
    super.key,
    required this.title,
    required this.description,
    required this.value,
    required this.updateValue,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }
}
