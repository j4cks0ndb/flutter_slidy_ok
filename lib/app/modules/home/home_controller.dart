import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'models/pokemon_model.dart';
import 'repositories/poke_repository.dart';
import 'package:slidy_ok/app/shared/auth/auth_controller.dart';
part 'home_controller.g.dart';


class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  
  
  //String text = '';

  final Pokerepository repository;

  @observable
  ObservableFuture<List<PokemonModel>> pokemons;


  _HomeControllerBase(this.repository){
    fetchPokemnos();
  }

  @action
  fetchPokemnos(){
    pokemons = repository.getAllPokemons().asObservable();
  }

  logoff() async {
    await Modular.get<AuthController>().logout();
    Modular.to.pushReplacementNamed('/login');
  }
  

}