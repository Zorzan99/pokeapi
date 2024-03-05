import 'package:flutter/material.dart';
import 'package:pokeapi/models/pokemon_model.dart';

class PokemonDetailsPage extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonDetailsPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name ?? ''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${pokemon.name ?? ''}'),
            Text('Type: ${pokemon.type?.join(', ') ?? ''}'),
            // Adicione mais detalhes conforme necessário
          ],
        ),
      ),
    );
  }
}
