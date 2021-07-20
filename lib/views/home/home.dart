import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/configs/paths.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/store/pokeapi/pokeapi_store.dart';
import 'package:pokedex/widgets/home/app_bar.dart';
import 'package:pokedex/widgets/home/poke_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  PokeApiStore _pokemonStore;
  AnimationController rotationController;

  @override
  void initState() {
    super.initState();
    _pokemonStore = PokeApiStore();
    _pokemonStore.fetchPokemonList();
    rotationController = AnimationController(
      duration: Duration(seconds: 5),
      upperBound: pi * 2,
      vsync: this,
    );
    rotationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
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
                        return (_pokeApi != null)
                            ? AnimationLimiter(
                                child: GridView.builder(
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.all(12),
                                  addAutomaticKeepAlives: true,
                                  gridDelegate:
                                      new SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  itemCount:
                                      _pokemonStore.pokeAPI.pokemon.length,
                                  itemBuilder: (context, index) {
                                    Pokemon pokemon =
                                        _pokemonStore.getPokemon(index: index);
                                    return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 375),
                                      columnCount: 2,
                                      child: ScaleAnimation(
                                        child: GestureDetector(
                                          child: PokeItem(
                                            types: pokemon.type,
                                            index: index,
                                            name: pokemon.name,
                                            num: pokemon.num,
                                          ),
                                          onTap: () {
                                            //         _pokemonStore.setPokemonAtual(
                                            //             index: index);
                                            //         Navigator.push(
                                            //           context,
                                            //           MaterialPageRoute(
                                            //             builder:
                                            //                 (BuildContext context) =>
                                            //                     PokeDetailPage(
                                            //               index: index,
                                            //             ),
                                            //             fullscreenDialog: true,
                                            //           ),
                                            //         );
                                            //       },
                                            //     ),
                                            //   ),
                                            // );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Center(
                                child: RotationTransition(
                                  turns: Tween(begin: 0.0, end: 1.0)
                                      .animate(rotationController),
                                  child: Image.asset(
                                    Paths.pokeball,
                                    height: 50,
                                    color: Colors.red[300],
                                  ),
                                ),
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
