import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/about_page/about_page.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetailPage extends StatefulWidget {
  final Pokemon pokemon;

  const PokeDetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  _PokeDetailPageState createState() => _PokeDetailPageState();
}

class _PokeDetailPageState extends State<PokeDetailPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _controller.forward();
    //_controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final pokemonController = Provider.of<PokeApiStore>(context);

    return Observer(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border),
              )
            ],
            leading: BackButton(),
            backgroundColor: pokemonController.getPokemonAtual.typeColor,
            elevation: 0,
          ),
          backgroundColor: pokemonController.getPokemonAtual.typeColor,
          body: Stack(
            children: [
              Observer(
                builder: (context) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          pokemonController.getPokemonAtual.typeColor,
                          pokemonController.getPokemonAtual.typeSecondaryColor,
                        ],
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Opacity(
                  child: Image.asset(
                    ConstsApp.whitePokeball,
                    height: 240,
                    width: 240,
                  ),
                  opacity: 0.1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Align(
                  child: Observer(
                    builder: (context) {
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              pokemonController.getPokemonAtual.name,
                              style: TextStyle(
                                fontFamily: 'Google',
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              '# ${pokemonController.getPokemonAtual.num}',
                              style: TextStyle(
                                fontFamily: 'Google',
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  alignment: Alignment.topLeft,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 8),
                child: Column(
                    children: List.generate(
                  pokemonController.getPokemonAtual.type.length,
                  (index) => Container(
                    margin: EdgeInsets.only(bottom: 9),
                    width: 65,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color.fromARGB(90, 255, 255, 255)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Center(
                        child: Text(
                          pokemonController.getPokemonAtual.type[index].trim(),
                          style: TextStyle(fontFamily: 'Google', fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )),
              ),
              Container(height: MediaQuery.of(context).size.height / 3),
              Padding(
                child: SizedBox(
                  height: 180,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      return pokemonController.setPokemonAtual(pokemon: pokemonController.pokemonList[value]);
                    },
                    itemCount: pokemonController.pokemonList.length,
                    controller: PageController(
                      initialPage: int.parse(widget.pokemon.num) - 1,
                      keepPage: true,
                      viewportFraction: 0.5,
                    ),
                    itemBuilder: (
                      BuildContext context,
                      int itemIndex,
                    ) {
                      Pokemon pokeitem = pokemonController.getPokemon(index: itemIndex);
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Hero(
                            child: Observer(
                              builder: (context) {
                                return AnimatedPadding(
                                  duration: Duration(milliseconds: 600),
                                  padding: EdgeInsets.all(pokeitem.id == pokemonController.pokemonAnimated ? 0 : 60),
                                  child: CachedNetworkImage(
                                    height: 250,
                                    width: 250,
                                    placeholder: (context, url) => new Container(
                                      color: Colors.transparent,
                                    ),
                                    color: pokeitem.id == pokemonController.pokemonAnimated ? null : Colors.black.withOpacity(0.5),
                                    imageUrl: pokeitem.urlImg,
                                  ),
                                );
                              },
                            ),
                            tag: pokeitem.id,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                padding: EdgeInsets.only(top: 30),
              ),
              SlidingSheet(
                elevation: 0,
                cornerRadius: 16,
                snapSpec: const SnapSpec(
                  snap: true,
                  snappings: [0.68, 1],
                  positioning: SnapPositioning.relativeToAvailableSpace,
                ),
                builder: (context, state) {
                  return Container(
                    height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height * 0.12,
                    child: AboutPage(),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
