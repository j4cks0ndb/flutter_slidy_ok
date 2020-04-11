import 'package:dio/dio.dart';
import 'package:slidy_ok/app/modules/home/models/pokemon_model.dart';


class Pokerepository{

  final Dio dio;

  Pokerepository(this.dio);

  
  Future<List<PokemonModel>>getAllPokemons() async {

    var response =  await dio.get('/pokemon');
    List<PokemonModel> list = [];
    for (var item in response.data['results']) {

      PokemonModel model = PokemonModel(name: item['name']);
      list.add(model);
      
    }

    return list;
  }


}