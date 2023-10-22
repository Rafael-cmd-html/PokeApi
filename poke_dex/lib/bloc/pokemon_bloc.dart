import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dex/bloc/pokemon_event.dart';
import 'package:poke_dex/bloc/pokemon_state.dart';
import 'package:poke_dex/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonRepository = PokemonRepository();
  PokemonBloc() : super(PokemonInitial());
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if (event is PokemonPageRequest) {
      yield PokemonLoadInProgress();

      try {
        final pokemonPageResponse =
            await _pokemonRepository.getPokemonPage(event.page);
        yield PokemonPageLoadSuccess(
            pokemonListings: pokemonPageResponse.pokemonListings,
            canLoadNextPage: pokemonPageResponse.loadNext);
      } catch (error) {
        yield PokemonPageLoadFailes(error: error as Error);
      }
    }
  }
}
