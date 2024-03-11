import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:pokeapi/app/models/pokemon_model.dart';
import 'package:pokeapi/app/pages/home/home_state.dart';
import 'package:pokeapi/app/repository/pokemons_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final PokemonsRepository _pokemonsRepository;
  final List<PokemonModel> pokemons = [];

  HomeCubit(this._pokemonsRepository) : super(InitialHome());

  Future<void> getPokemons() async {
    emit(LoadingHome());
    await Future.delayed(const Duration(seconds: 3));

    try {
      final pokemons = await _pokemonsRepository.getPokemons();
      this.pokemons
        ..clear()
        ..addAll(pokemons);
      emit(LoadedHome(pokemons: this.pokemons));
    } catch (e, s) {
      log('Erro ao buscar pokemons', error: e, stackTrace: s);
      emit(FailureHome(message: 'Erro ao Buscar Pokemons'));
    }
  }

  void filterPokemonsByType(String type) async {
    emit(LoadingFiltered());
    await Future.delayed(const Duration(seconds: 2));

    if (type.isEmpty) {
      emit(LoadedHome(pokemons: pokemons));
      return;
    }

    final filtered = pokemons
        .where((pokemon) =>
            pokemon.type != null &&
            pokemon.type!.isNotEmpty &&
            pokemon.type![0].toLowerCase() == type.toLowerCase())
        .toList();

    emit(FilteredHome(filteredPokemons: filtered));
  }

  Future<void> clearFilter() async {
    emit(LoadingFiltered());
    await Future.delayed(const Duration(seconds: 2));
    emit(LoadedHome(pokemons: pokemons));
  }
}
