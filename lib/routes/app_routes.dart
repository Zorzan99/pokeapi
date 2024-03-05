import 'package:flutter/material.dart';
import 'package:pokeapi/models/pokemon_model.dart';
import 'package:pokeapi/pages/home/home_page.dart';
import 'package:pokeapi/pages/pokemon_detail/pokemon_detail_page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/pokemon_details':
        final pokemon = settings.arguments as PokemonModel;
        return MaterialPageRoute(
            builder: (_) => PokemonDetailsPage(pokemon: pokemon));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Rota desconhecida: ${settings.name}'),
            ),
          ),
        );
    }
  }
}
