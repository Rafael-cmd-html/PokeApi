import 'package:flutter/material.dart';
import 'package:poke_dex/common/models/pokemon.dart';
import 'package:poke_dex/common/repositories/pokemon_repository.dart';
import 'package:poke_dex/details/features/home/pages/home_error.dart';
import 'package:poke_dex/details/features/home/pages/home_loading.dart';
import 'package:poke_dex/details/features/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key, required this.repository});
  final IPokemonRepository repository;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return HomeLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(list: snapshot.data!);
        }

        if (snapshot.hasError) {
          return HomeError(error: snapshot.error.toString());
        }

        return Container();
      },
    );
  }
}