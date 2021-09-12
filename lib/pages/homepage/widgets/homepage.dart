import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/pages/homepage/widgets/dialog_change_name.dart';
import 'package:pokedex/pages/homepage/widgets/poke_item.dart';
import 'package:pokedex/pages/poke_detail/poke_detail_page.dart';
import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:provider/provider.dart';

import 'app_bar_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final double screenWidth = MediaQuery.of(context).size.width;
  late final double statusWidth = MediaQuery.of(context).padding.top;

  late final PokeApiStore pokeController = Provider.of<PokeApiStore>(context)..fetchPokemonList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            top: (-240 / 4.5),
            left: screenWidth - (240 / 1.5),
            child: Opacity(
              child: Image.asset(
                ConstsApp.blackPokeball,
                height: 240,
                width: 240,
              ),
              opacity: 0.1,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: statusWidth,
                ),
                AppBarHome(),
                Expanded(
                  child: Container(
                    child: Observer(
                      builder: (BuildContext context) {
                        return AnimationLimiter(
                          child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.all(12),
                            addAutomaticKeepAlives: true,
                            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                            itemCount: pokeController.pokemonList.length,
                            itemBuilder: (context, index) {
                              Pokemon pokemon = pokeController.pokemonList[index];
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                columnCount: 2,
                                child: ScaleAnimation(
                                  child: GestureDetector(
                                    child: PokeItem(
                                      index: index,
                                      name: pokemon.name,
                                      num: pokemon.num,
                                      color: Colors.transparent,
                                      types: pokemon.type,
                                    ),
                                    onLongPress: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return DialogChangeName(pokemon: pokemon, pokeController: pokeController);
                                        },
                                      );
                                    },
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) => PokeDetailPage(
                                            index: index,
                                            name: '_pokemon',
                                          ),
                                          fullscreenDialog: true,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
