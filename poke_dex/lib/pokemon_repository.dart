import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:poke_dex/pokemon_page_respond.dart';

class PokemonRepository {
  final baseUrl = 'pokeapi.co';
  final client = HttpClient();

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    // pokemon?limit=200&offset=400

    final queryParameters = {
      'limit': '200',
      'offset': (pageIndex * 200).toString()
    };

    final uri = Uri.https(baseUrl, 'api/v2/pokemon', queryParameters);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonPageResponse.fromJson(json);
  }
}

mixin body {}