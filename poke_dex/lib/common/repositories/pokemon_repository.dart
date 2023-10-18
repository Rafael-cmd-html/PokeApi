import 'package:dio/dio.dart';
import 'package:poke_dex/common/models/pokemon.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});
  @override
  Future<List<Pokemon>> getAllPokemons() {
    try {
      dio.get(path);
    } catch (e) {}
  }
}
