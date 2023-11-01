import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dex/bloc/nav_cubit.dart';
import 'package:poke_dex/pokedex_view.dart';
import 'package:poke_dex/pokemon_details_view.dart';

class AppNavigator extends StatelessWidget {
  final pokedex = PokedexView();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int?>(builder: (context, pokemonId) {
      return Navigator(
          pages: [
            MaterialPage(child: pokedex),
            if (pokemonId != null) MaterialPage(child: PokemonDetailsView())
          ],
          onPopPage: (route, result) {
            pokedex.getCurrentPage();
            BlocProvider.of<NavCubit>(context).popToPokedex();
            return route.didPop(result);
          });
    });
  }
}
