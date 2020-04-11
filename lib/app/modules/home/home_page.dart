import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.highlight_off),onPressed: homeController.logoff,),
        title: Text('Home'),
      ),
      body: Observer(builder: (_){
        if(homeController.pokemons.error != null){
          return Center(child: Text('Erro'),);
        }

        if(homeController.pokemons.value == null){
          return Center(child: CircularProgressIndicator());
        }

        var list = homeController.pokemons.value;

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index ){
            return ListTile(
              title: Text(list[index].name),
            );
          },

          );

      }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add
        ),
        onPressed: (){
          //Navigator.pushNamed(context, '/other/${homeController.text}');
          //Modular.to.pushNamed('/other');
          homeController.fetchPokemnos();
        },
      ),
    );
  }
}