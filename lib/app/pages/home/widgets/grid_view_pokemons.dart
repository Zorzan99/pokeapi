import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi/app/pages/home/home_cubit.dart';
import 'package:pokeapi/app/pages/home/home_state.dart';
import 'package:pokeapi/app/pages/home/widgets/alert_dialog_pokemons.dart';
import 'package:pokeapi/app/pages/home/widgets/body_grid_view.dart';
import 'package:pokeapi/app/pages/home/widgets/loader.dart';
import 'package:pokeapi/app/pages/widgets/get_type_colors.dart';

class GridViewPokemons extends StatefulWidget {
  const GridViewPokemons({super.key});

  @override
  State<GridViewPokemons> createState() => _GridViewPokemonsState();
}

class _GridViewPokemonsState extends State<GridViewPokemons> {
  late String type;

  @override
  void initState() {
    super.initState();
    type = '';
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
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.redAccent,
              child: const Icon(Icons.filter_alt_outlined),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialogPokemons(type: type);
                  },
                );
              },
            ),
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: const Text(
                'Pokedex',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    context.read<HomeCubit>().clearFilter();
                  },
                ),
              ],
              backgroundColor: Colors.black,
            ),
            body: BodyGridView(
              pokemons: state.pokemons,
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
        } else if (state is FilteredHome) {
          if (state.filteredPokemons.isEmpty) {
            return const Center(
              child: Text(
                'Nenhum Pokémon encontrado',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: GetTypeColors()
                    .getColorForType(state.filteredPokemons[0].type![0]),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialogPokemons(type: type);
                    },
                  );
                },
                child: const Icon(Icons.filter_alt_outlined),
              ),
              backgroundColor: Colors.black,
              appBar: AppBar(
                title: const Text(
                  'Pokedex',
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      context.read<HomeCubit>().clearFilter();
                    },
                  ),
                ],
                backgroundColor: Colors.black,
              ),
              body: BodyGridView(
                pokemons: state.filteredPokemons,
              ));
        } else if (state is LoadingFiltered) {
          return Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/circular.gif',
                  ),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Carregando',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
