import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi/pages/home/home_cubit.dart';
import 'package:pokeapi/pages/home/widgets/grid_view_pokemons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final cubit = context.read()<HomeCubit>();
    // cubit.getPokemons();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [GridViewPokemons()],
        ),
      ),
    );
  }
}
