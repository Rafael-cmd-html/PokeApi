import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dex/bloc/nav_cubit.dart';
import 'package:poke_dex/bloc/pokemon_bloc.dart';
import 'package:poke_dex/bloc/pokemon_details_cubit.dart';
import 'package:poke_dex/bloc/pokemon_event.dart';
import 'package:poke_dex/pokedex_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final pokemonDetailsCubit = PokemonDetailsCubit();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  PokemonBloc()..add(PokemonPageRequest(page: 0))),
          BlocProvider(
              create: (context) =>
                  NavCubit(pokemonDetailsCubit: pokemonDetailsCubit)),
          BlocProvider(create: (context) => pokemonDetailsCubit)
        ],
        child: PokedexView(),
      ),
    );
  }
}
