import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/store/pokeapi/pokeapi_store.dart';
import 'package:pokedex/widgets/home/app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PokeApiStore _pokemonStore;
  @override
  void initState() {
    super.initState();
    _pokemonStore = PokeApiStore();
    _pokemonStore.fetchPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    double statusWidth = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: statusWidth,
                ),
                AppBarHome(),
                Expanded(
                  child: Container(
                    child: Observer(
                      name: 'ListHome',
                      builder: (context) {
                        PokeAPI _pokeApi = _pokemonStore.pokeAPI;
                        return _pokeApi != null
                            ? ListView.builder(
                                itemCount: _pokemonStore.pokeAPI.pokemon.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(_pokeApi.pokemon[index].name),
                                  );
                                },
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
