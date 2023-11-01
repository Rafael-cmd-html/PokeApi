import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dex/bloc/pokemon_details_cubit.dart';

class NavCubit extends Cubit<int?> {
  PokemonCubit pokemonDetailsCubit;

  NavCubit({required this.pokemonDetailsCubit}) : super(null);

  void showPokemonDetails(int pokemonId) {
    print(pokemonId);
    pokemonDetailsCubit.getPokemonDetails(pokemonId);
    emit(pokemonId);
  }

  void popToPokedex() {
    emit(null);
    pokemonDetailsCubit.clearPokemonDetails();
  }
}
