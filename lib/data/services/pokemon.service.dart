import 'package:dio/dio.dart';
import 'package:flutter_demo/data/models/paginationResponse.dart';
import 'package:flutter_demo/data/models/pokemon.dart';

class PokemonService {
  Future<List<PokemonResume>> listPokemon(
      {required int limit, required int offset}) async {
    Response response = await Dio()
        .get('https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset');

    print(response);
    PaginationResponse res = PaginationResponse.fromMap(response.data);
    List<PokemonResume> pkmns = res.results
        .map<PokemonResume>((pknresume) => PokemonResume.fromMap(pknresume))
        .toList();
    return pkmns;
  }
}
