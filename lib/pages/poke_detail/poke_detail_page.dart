import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/pages/homepage/widgets/poke_item.dart';
import 'package:pokedex/stores/pokeapi_store.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PokeDetailPage extends StatelessWidget {
  final int index;
  final String name;

  const PokeDetailPage({Key? key, required this.index, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final pokemonController = Provider.of<PokeApiStore>(context);
    Pokemon _pokemon = pokemonController.getPokemon(index: index);
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
            padding: const EdgeInsets.only(top: 10.0),
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
                  Spacer(flex: 50),
                  Text(
                    _pokemon.num,
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
          SlidingSheet(
            elevation: 0,
            cornerRadius: 16,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.7, 1.0],
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
