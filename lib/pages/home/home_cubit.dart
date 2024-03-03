import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:pokeapi/pages/home/home_state.dart';
import 'package:pokeapi/repository/pokemons_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final PokemonsRepository _pokemonsRepository;
  HomeCubit(this._pokemonsRepository) : super(InitialHome());

  Future<void> getPokemons() async {
    emit(LoadingHome());
    await Future.delayed(const Duration(seconds: 3));

    try {
      final pokemons = await _pokemonsRepository.getPokemons();
      emit(LoadedHome(pokemons: pokemons));
    } catch (e, s) {
      log('Erro ao buscar pokemons', error: e, stackTrace: s);
      emit(FailureHome(message: 'Erro ao realizar login'));
    }
  }
}
