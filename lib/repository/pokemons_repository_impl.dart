import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokeapi/api/api_base.dart';
import 'package:pokeapi/models/pokemon_model.dart';

import './pokemons_repository.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final ApiBase apiBase;

  PokemonsRepositoryImpl({required this.apiBase});

  @override
  Future<List<PokemonModel>> getPokemons() async {
    try {
      final result =
          await apiBase.get('/PokemonGO-Pokedex/master/pokedex.json');
      final List<dynamic> pokemonList = json.decode(result.data)['pokemon'];
      final List<PokemonModel> pokemons = pokemonList
          .map<PokemonModel>((pokemonData) => PokemonModel.fromMap(pokemonData))
          .toList();
      return pokemons;
    } on DioException catch (e, s) {
      log('Erro ao buscar dados do pokemon', error: e, stackTrace: s);
      throw Exception('Erro ao buscar usuário');
    }
  }
}
