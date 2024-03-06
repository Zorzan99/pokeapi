import 'package:flutter/material.dart';

import 'package:pokeapi/models/pokemon_model.dart';

class CardPokmenons extends StatelessWidget {
  final List<PokemonModel> pokemons = [];
  final PokemonModel pokemon;
  final Widget imageNetwork;

  final String title;
  final String title2;

  CardPokmenons({
    super.key,
    required this.pokemon,
    required this.imageNetwork,
    required this.title,
    required this.title2,
  });

  Color getColorForType(String type) {
    switch (type) {
      case 'Grass':
        return const Color(0XFF45d0b0);
      case 'Poison':
        return const Color(0XFFB567CE);
      case 'Bug':
        return const Color(0XFF91C12F);
      case 'Normal':
        return const Color(0XFF919AA2);
      case 'Ground':
        return const Color(0XFFD97845);
      case 'Fighting ':
        return const Color(0XFFCE416B);
      case 'Psychic  ':
        return const Color(0XFFFA7179);
      case 'Water':
        return const Color(0XFF77befe);
      case 'Dragon  ':
        return const Color(0XFFCBBE48);
      case 'Rock  ':
        return const Color(0XFFC5B78C);
      case 'Ice  ':
        return const Color(0XFF77befa);
      case 'Fire':
        return const Color(0xFFFF9D55);
      case 'Ghost':
        return const Color(0XFF5269AD);
      case 'Electric':
        return const Color(0XFFffd970);
      default:
        return const Color(0XFFFFD86F);
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: sizeWidth * 0.15,
      decoration: BoxDecoration(
        color: getColorForType(pokemon.type![0]),
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
