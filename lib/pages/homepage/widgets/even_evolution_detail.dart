import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/stores/pokemon_controller.dart';
import 'package:provider/provider.dart';

class EvenEvolutionDetail extends StatelessWidget {
  final Evolution evolution;

  const EvenEvolutionDetail({Key? key, required this.evolution}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final pokemonController = Provider.of<PokemonController>(context);
    Pokemon pokemon = pokemonController.getPokemon(index: int.parse(evolution.num ?? '0') - 1);

    return Container(
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: CachedNetworkImage(imageUrl: pokemon.urlImg),
            height: 80,
            width: 80,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  evolution.name ?? '',
                  style: TextStyle(fontSize: 16, fontFamily: 'Google'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  pokemon.weaknesses.join(" // "),
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Google',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
