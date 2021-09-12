import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetailPage extends StatefulWidget {
  final int index;
  final String name;

  const PokeDetailPage({Key? key, required this.index, required this.name}) : super(key: key);

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
    Pokemon _pokemon = pokemonController.getPokemon(index: widget.index);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
          )
        ],
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: ConstsAPI.getColorType(type: _pokemon.type[0]),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Align(
              child: Row(
                children: [
                  Text(
                    _pokemon.name,
                    style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '# ${_pokemon.num}',
                    style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              alignment: Alignment.topLeft,
            ),
          ),
          Container(height: MediaQuery.of(context).size.height / 3),
          Positioned(
            top: 50,
            left: (MediaQuery.of(context).size.width / 2) - 75,
            child: GestureDetector(
              onTap: () {
                _controller.forward(from: 0);
              },
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                    child: CachedNetworkImage(
                      imageUrl: 'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${_pokemon.num}.png',
                      height: lerpDouble(30, 150, _controller.value),
                      width: 150,
                    ),
                  );
                },
              ),
            ),
          ),
          SlidingSheet(
            elevation: 0,
            cornerRadius: 16,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.68, 0.93],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
              );
            },
          ),
        ],
      ),
    );
  }
}
