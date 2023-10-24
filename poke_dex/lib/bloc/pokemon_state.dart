import 'package:poke_dex/data/pokemon_page_respond.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadInProgress extends PokemonState {}

class PokemonPageLoadSuccess extends PokemonState {
  final List<PokemonListing> pokemonListings;
  final bool canLoadNextPage;

  PokemonPageLoadSuccess(
      {required this.pokemonListings, required this.canLoadNextPage});
}

class PokemonPageLoadFailes extends PokemonState {
  final Error error;

  PokemonPageLoadFailes({required this.error});
}
