import 'package:flutter/material.dart';
import 'package:poke_dex/pokedex_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PokedexView(),
    );
  }
}
