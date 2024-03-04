import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi/models/pokemon_model.dart';
import 'package:pokeapi/pages/home/home_cubit.dart';
import 'package:pokeapi/pages/home/home_state.dart';
import 'package:pokeapi/pages/home/widgets/card_pokmenons.dart';
import 'package:pokeapi/pages/home/widgets/loader.dart';

class GridViewPokemons extends StatefulWidget {
  const GridViewPokemons({super.key});

  @override
  State<GridViewPokemons> createState() => _GridViewPokemonsState();
}

class _GridViewPokemonsState extends State<GridViewPokemons> {
  List<PokemonModel> pokemons = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().getPokemons();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is LoadedHome) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: const Text(
                'Pokedex',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.black,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 1.4,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    itemCount: state.pokemons.length,
                    itemBuilder: (context, index) {
                      final pokemon = state.pokemons[index];
                      return CardPokmenons(
                        pokemon: pokemon,
                        title: pokemon.name ?? '',
                        title2:
                            pokemon.type!.length > 1 ? pokemon.type![1] : '',
                        imageNetwork: CachedNetworkImage(
                          imageUrl: pokemon.img ?? '',
                          height: 70,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        } else if (state is LoadingHome) {
          return const Loader();
        } else {
          // Trate outros estados aqui, se necessário
          return const SizedBox.shrink(); // Ou qualquer outro widget vazio
        }
      },
    );
  }
}
