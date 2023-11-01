import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:poke_dex/data/pokemon_info_response.dart';
import 'package:poke_dex/data/pokemon_page_respond.dart';
import 'package:poke_dex/data/pokemon_species_info_response.dart';

class PokemonRepository {
  final baseUrl = 'pokeapi.co';
  final client = http.Client();
  final generations = [
    {
      "offset": '0',
      "limit": '151',
    },
    {
      "offset": '151',
      "limit": '100',
    },
    {
      "offset": '251',
      "limit": '135',
    },
    {
      "offset": '386',
      "limit": '107',
    },
    {
      "offset": '494',
      "limit": '156',
    },
    {
      "offset": '649',
      "limit": '72',
    },
    {
      "offset": '723',
      "limit": '88',
    },
    {
      "offset": '809',
      "limit": '96',
    },
    {
      "offset": '905',
      "limit": '105',
    },
  ];

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    // pokemon?limit=200&offset=400

    final queryParameters = generations[pageIndex];

    final uri = Uri.https(baseUrl, 'api/v2/pokemon', queryParameters);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonPageResponse.fromJson(json);
  }

  Future<PokemonInfoResponse> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonInfoResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  Future<PokemonSpeciesInfoResponse> getPokemonSpeciesInfo(
      int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonSpeciesInfoResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
