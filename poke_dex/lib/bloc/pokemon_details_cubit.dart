import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dex/data/pokemon_detail.dart';
import 'package:poke_dex/data/pokemon_info_response.dart';
import 'package:poke_dex/data/pokemon_repository.dart';
import 'package:poke_dex/data/pokemon_species_info_response.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails> {
  final _pokemonRepository = PokemonRepository();
  bool? nS;
  PokemonDetailsCubit() : super(null!);

  void getPokemonDetails(int pokemonId) async {
    final responses = await Future.wait([
      _pokemonRepository.getPokemonInfo(pokemonId),
      _pokemonRepository.getPokemonSpeciesInfo(pokemonId)
    ]);

    final pokemonInfo = responses[0] as PokemonInfoResponse;
    final speciesInfo = responses[1] as PokemonSpeciesInfoResponse;

    emit(PokemonDetails(
        id: pokemonInfo.id,
        name: pokemonInfo.name,
        imageUrl: pokemonInfo.imageUrl,
        types: pokemonInfo.types,
        height: pokemonInfo.height,
        weight: pokemonInfo.weight,
        description: speciesInfo.description));
  }

  void clearPokemonDetails() => emit(null!);
}
