// "count": 1292,
//   "next": "https://pokeapi.co/api/v2/pokemon?offset=200&limit=200",
//   "previous": null,
//   "results": [
//     {
//       "name": "bulbasaur",
//       "url": "https://pokeapi.co/api/v2/pokemon/1/"
//     },
//     {
//       "name": "ivysaur",
//       "url": "https://pokeapi.co/api/v2/pokemon/2/"
//     }

//-------INICIO DEL CÓDIGO
// Creamos un objeto pequeño para obtener solo el nombre y la id del pokemon
class PokemonListing {
  final int id;
  final String name;

  PokemonListing({required this.id, required this.name});

  factory PokemonListing.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final url = json['url'] as String;
    final id = int.parse(
        url.split('/')[6]); //Separamos el String de la url para obtener el id
    return PokemonListing(id: id, name: name);
  }
}

// Realizamos la clase que nos permitirá saber si seguiremos cargando el resto de pokemons o si se completo la carga de los mismos
class PokemonPageResponse {
  final List<PokemonListing> pokemonListings;
  final bool loadNext;

  PokemonPageResponse({required this.pokemonListings, required this.loadNext});

  // El metodo factory nos servirá para una lista de pokemons en caso de que sea posible cargar más pokemons
  // Recibirá como parametros String y Dynamic, permitiendo que el segundo valor pueda ser nulo o String
  factory PokemonPageResponse.fromJson(Map<String, dynamic> json) {
    final canLoadNext = json['next'] != null;
    final pokemonListings = (json['result'] as List)
        .map((listingJson) => PokemonListing.fromJson(listingJson))
        .toList();
    return PokemonPageResponse(
        pokemonListings: pokemonListings, loadNext: canLoadNext);
  }
}
