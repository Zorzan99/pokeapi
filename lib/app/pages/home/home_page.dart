import 'package:flutter/material.dart';
import 'package:pokeapi/app/pages/home/widgets/grid_view_pokemons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: GridViewPokemons());
  }
}
