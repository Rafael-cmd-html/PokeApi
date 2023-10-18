import 'package:flutter/material.dart';
import 'package:poke_dex/common/repositories/pokemon_repository.dart';
import 'package:poke_dex/details/features/home/container/home_container.dart';
import 'package:poke_dex/details/features/home/pages/home_loading.dart';
import 'package:poke_dex/details/features/home/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex ',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeContainer(
        repository: PokemonRepository(),
      ),
    );
  }
}
