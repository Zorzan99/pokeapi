import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
            body: AnimationLimiter(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 1.4,
                ),
                padding: const EdgeInsets.all(8.0),
                itemCount: state.pokemons.length,
                itemBuilder: (context, index) {
                  final pokemon = state.pokemons[index];
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
                        child: CardPokmenons(
                          pokemon: pokemon,
                          title: pokemon.name ?? '',
                          title2:
                              pokemon.type!.length > 1 ? pokemon.type![1] : '',
                          imageNetwork: CachedNetworkImage(
                            imageUrl: pokemon.img ?? '',
                            height: 70,
                            fadeInDuration: const Duration(seconds: 4),
                            fadeOutDuration: const Duration(seconds: 3),
                            placeholder: (context, url) {
                              return Center(
                                child:
                                    Image.asset('assets/images/circular.gif'),
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
            ),
          );
        } else if (state is LoadingHome) {
          return const Center(child: Loader());
        } else if (state is FailureHome) {
          return const Center(
            child: Text(
              'Erro ao carregar os dados',
              style: TextStyle(color: Colors.red),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
