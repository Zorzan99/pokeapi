import 'package:pokeapi/models/pokemon_model.dart';

abstract interface class PokemonsService {
  Future<List<PokemonModel>> getPokemons();
}
