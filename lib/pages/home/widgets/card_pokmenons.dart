import 'package:flutter/material.dart';

import 'package:pokeapi/models/pokemon_model.dart';
import 'package:pokeapi/pages/widgets/get_type_colors.dart';

class CardPokemons extends StatelessWidget {
  final List<PokemonModel> pokemons = [];
  final PokemonModel pokemon;
  final Widget imageNetwork;

  final String title;
  final String title2;

  CardPokemons({
    super.key,
    required this.pokemon,
    required this.imageNetwork,
    required this.title,
    required this.title2,
  });

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: sizeWidth * 0.15,
      decoration: BoxDecoration(
        color: GetTypeColors().getColorForType(pokemon.type![0]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                pokemon.name ?? '',
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(4),
                width: sizeWidth * 0.15,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  pokemon.type![0],
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: pokemon.type!.length > 1,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  width: sizeWidth * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    pokemon.type!.length > 1 ? pokemon.type![1] : '',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(top: 50, right: 0, child: imageNetwork),
        ],
      ),
    );
  }
}
