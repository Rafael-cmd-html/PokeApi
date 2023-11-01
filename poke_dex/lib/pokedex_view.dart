import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_dex/bloc/nav_cubit.dart';
import 'package:poke_dex/bloc/pokemon_bloc.dart';
import 'package:poke_dex/bloc/pokemon_state.dart';
import 'package:poke_dex/data/pokemon_repository.dart';

class PokedexView extends StatelessWidget {
  int currentPage = 0; // Variable para rastrear la pestaña actual
  late var pokemonRepository = PokemonRepository();
  int getCurrentPage() {
    return this.currentPage;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9, // Número de pestañas que deseas
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Pokedex'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Gen1'),
              Tab(text: 'Gen2'),
              Tab(text: 'Gen3'),
              Tab(text: 'Gen4'),
              Tab(text: 'Gen5'),
              Tab(text: 'Gen6'),
              Tab(text: 'Gen7'),
              Tab(text: 'Gen8'),
              Tab(text: 'Gen9'),
            ],
            onTap: (index) {
              currentPage = index;
              print('Hola $context');
              // Actualiza la variable currentPage cuando se cambia de pestaña
            },
          ),
        ),
        body: TabBarView(
          physics:
              NeverScrollableScrollPhysics(), // Evita el desplazamiento deslizando
          children: [
            // Contenido de la primera pestaña (Gen1)
            BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state is PokemonLoadInProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PokemonPageLoadSuccess) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: state.pokemonListings.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => BlocProvider.of<NavCubit>(context)
                            .showPokemonDetails(
                                state.pokemonListings[index].id),
                        child: Card(
                          child: GridTile(
                            child: Column(
                              children: [
                                Image.network(
                                    state.pokemonListings[index].imageUrl),
                                Text(state.pokemonListings[index].name)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is PokemonPageLoadFailes) {
                  return Center(
                    child: Text(state.error.toString()),
                  );
                } else {
                  return Container();
                }
              },
            ),
            // Contenido de la segunda pestaña (Gen2)
            BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state is PokemonLoadInProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PokemonPageLoadSuccess) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: state.pokemonListings.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => BlocProvider.of<NavCubit>(context)
                            .showPokemonDetails(
                                state.pokemonListings[index].id),
                        child: Card(
                          child: GridTile(
                            child: Column(
                              children: [
                                Image.network(
                                    state.pokemonListings[index].imageUrl),
                                Text(state.pokemonListings[index].name)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is PokemonPageLoadFailes) {
                  return Center(
                    child: Text(state.error.toString()),
                  );
                } else {
                  return Container();
                }
              },
            ),
            BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state is PokemonLoadInProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PokemonPageLoadSuccess) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: state.pokemonListings.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => BlocProvider.of<NavCubit>(context)
                            .showPokemonDetails(
                                state.pokemonListings[index].id),
                        child: Card(
                          child: GridTile(
                            child: Column(
                              children: [
                                Image.network(
                                    state.pokemonListings[index].imageUrl),
                                Text(state.pokemonListings[index].name)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is PokemonPageLoadFailes) {
                  return Center(
                    child: Text(state.error.toString()),
                  );
                } else {
                  return Container();
                }
              },
            ),
            BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state is PokemonLoadInProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PokemonPageLoadSuccess) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: state.pokemonListings.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => BlocProvider.of<NavCubit>(context)
                            .showPokemonDetails(
                                state.pokemonListings[index].id),
                        child: Card(
                          child: GridTile(
                            child: Column(
                              children: [
                                Image.network(
                                    state.pokemonListings[index].imageUrl),
                                Text(state.pokemonListings[index].name)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is PokemonPageLoadFailes) {
                  return Center(
                    child: Text(state.error.toString()),
                  );
                } else {
                  return Container();
                }
              },
            ),
            BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state is PokemonLoadInProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PokemonPageLoadSuccess) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: state.pokemonListings.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => BlocProvider.of<NavCubit>(context)
                            .showPokemonDetails(
                                state.pokemonListings[index].id),
                        child: Card(
                          child: GridTile(
                            child: Column(
                              children: [
                                Image.network(
                                    state.pokemonListings[index].imageUrl),
                                Text(state.pokemonListings[index].name)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is PokemonPageLoadFailes) {
                  return Center(
                    child: Text(state.error.toString()),
                  );
                } else {
                  return Container();
                }
              },
            ),
            BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state is PokemonLoadInProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PokemonPageLoadSuccess) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: state.pokemonListings.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => BlocProvider.of<NavCubit>(context)
                            .showPokemonDetails(
                                state.pokemonListings[index].id),
                        child: Card(
                          child: GridTile(
                            child: Column(
                              children: [
                                Image.network(
                                    state.pokemonListings[index].imageUrl),
                                Text(state.pokemonListings[index].name)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is PokemonPageLoadFailes) {
                  return Center(
                    child: Text(state.error.toString()),
                  );
                } else {
                  return Container();
                }
              },
            ),
            BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state is PokemonLoadInProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PokemonPageLoadSuccess) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: state.pokemonListings.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => BlocProvider.of<NavCubit>(context)
                            .showPokemonDetails(
                                state.pokemonListings[index].id),
                        child: Card(
                          child: GridTile(
                            child: Column(
                              children: [
                                Image.network(
                                    state.pokemonListings[index].imageUrl),
                                Text(state.pokemonListings[index].name)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is PokemonPageLoadFailes) {
                  return Center(
                    child: Text(state.error.toString()),
                  );
                } else {
                  return Container();
                }
              },
            ),
            BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state is PokemonLoadInProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PokemonPageLoadSuccess) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: state.pokemonListings.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => BlocProvider.of<NavCubit>(context)
                            .showPokemonDetails(
                                state.pokemonListings[index].id),
                        child: Card(
                          child: GridTile(
                            child: Column(
                              children: [
                                Image.network(
                                    state.pokemonListings[index].imageUrl),
                                Text(state.pokemonListings[index].name)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is PokemonPageLoadFailes) {
                  return Center(
                    child: Text(state.error.toString()),
                  );
                } else {
                  return Container();
                }
              },
            ),
            BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state is PokemonLoadInProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PokemonPageLoadSuccess) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemCount: state.pokemonListings.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => BlocProvider.of<NavCubit>(context)
                            .showPokemonDetails(
                                state.pokemonListings[index].id),
                        child: Card(
                          child: GridTile(
                            child: Column(
                              children: [
                                Image.network(
                                    state.pokemonListings[index].imageUrl),
                                Text(state.pokemonListings[index].name)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is PokemonPageLoadFailes) {
                  return Center(
                    child: Text(state.error.toString()),
                  );
                } else {
                  return Container();
                }
              },
            ),
            // ... Otros bloques de construcción para el contenido de las demás pestañas
          ],
        ),
      ),
    );
  }
}
