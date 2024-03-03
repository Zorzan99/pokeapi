import 'package:pokeapi/models/pokemon_model.dart';
import 'package:pokeapi/repository/pokemons_repository.dart';

import './pokemons_service.dart';

class PokemonsServiceImpl implements PokemonsService {
  final PokemonsRepository _pokemonsRepository;

  PokemonsServiceImpl({required PokemonsRepository pokemonsRepository})
      : _pokemonsRepository = pokemonsRepository;

  @override
  Future<List<PokemonModel>> getPokemons() => _pokemonsRepository.getPokemons();
}
