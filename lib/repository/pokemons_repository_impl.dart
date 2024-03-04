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

      final json = jsonDecode(result.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => PokemonModel.fromMap(e)).toList();
    } on DioException catch (e, s) {
      log('Erro ao buscar dados do pokemon', error: e, stackTrace: s);
      throw Exception('Erro ao buscar usuário');
    }
  }
}
