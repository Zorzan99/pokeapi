import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:pokeapi/app/models/pokemon_model.dart';
import 'package:pokeapi/app/pages/home/widgets/card_pokmenons.dart';

class BodyGridView extends StatelessWidget {
  final List<PokemonModel> pokemons;

  const BodyGridView({
    super.key,
    required this.pokemons,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 1.4,
        ),
        padding: const EdgeInsets.all(8.0),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];
          return AnimationConfiguration.staggeredGrid(
            position: index,
            columnCount: 2,
            duration: const Duration(milliseconds: 500),
            child: ScaleAnimation(
              delay: const Duration(milliseconds: 275),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/pokemon_details',
                    arguments: pokemon,
                  );
                },
                child: CardPokemons(
                  pokemon: pokemon,
                  title: pokemon.name ?? '',
                  title2: pokemon.type!.length > 1 ? pokemon.type![1] : '',
                  imageNetwork: CachedNetworkImage(
                    imageUrl: pokemon.img ?? '',
                    height: 70,
                    fadeInDuration: const Duration(seconds: 4),
                    fadeOutDuration: const Duration(seconds: 3),
                    placeholder: (context, url) {
                      return Center(
                        child: Image.asset('assets/images/circular.gif'),
                      );
                    },
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
