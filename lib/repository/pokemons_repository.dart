import 'package:pokeapi/models/pokemon_model.dart';

abstract interface class PokemonsRepository {
  Future<List<PokemonModel>> getPokemons();
}
