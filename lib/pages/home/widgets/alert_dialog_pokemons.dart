import 'package:flutter/material.dart';

class AlertDialogPokemons extends StatelessWidget {
  final String type;

  const AlertDialogPokemons({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(type),
      onTap: () {
        Navigator.of(context).pop(type);
      },
    );
  }
}
