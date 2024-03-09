import 'package:pokeapi/models/pokemon_model.dart';

sealed class HomeState {}

class InitialHome implements HomeState {}

class LoadingHome implements HomeState {}

class LoadingFiltered implements HomeState {}

class LoadedHome implements HomeState {
  final List<PokemonModel> pokemons;
  LoadedHome({
    required this.pokemons,
  });
}

class FilteredHome implements HomeState {
  final List<PokemonModel> filteredPokemons;
  FilteredHome({
    required this.filteredPokemons,
  });
}

class FailureHome implements HomeState {
  final String message;
  FailureHome({
    required this.message,
  });
}
