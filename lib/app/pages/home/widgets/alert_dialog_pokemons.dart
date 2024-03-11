import 'package:flutter/material.dart';
import 'package:pokeapi/app/pages/home/widgets/type_options.dart';

class AlertDialogPokemons extends StatelessWidget {
  final String type;

  const AlertDialogPokemons({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Selecione um tipo'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TypeOptions(type: 'Grass'),
            TypeOptions(type: 'Poison'),
            TypeOptions(type: 'Bug'),
            TypeOptions(type: 'Normal'),
            TypeOptions(type: 'Ground'),
            TypeOptions(type: 'Fighting'),
            TypeOptions(type: 'Psychic'),
            TypeOptions(type: 'Water'),
            TypeOptions(type: 'Dragon'),
            TypeOptions(type: 'Rock'),
            TypeOptions(type: 'Ice'),
            TypeOptions(type: 'Fire'),
            TypeOptions(type: 'Ghost'),
            TypeOptions(type: 'Electric'),
          ],
        ),
      ),
    );
  }
}
