import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dex/bloc/pokemon_details_cubit.dart';
import 'package:poke_dex/data/pokemon_detail.dart';

class PokemonDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: BlocBuilder<PokemonDetailsCubit,PokemonDetails>(
          builder: (context, details) {
            return details !=null
            ? Center(child: Text(details.name))
            : Center(child:CircularProgressIndicator())
          },
        ));
  }
}
