import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/stores/pokemon_controller.dart';
import 'package:provider/provider.dart';

class OddEvolutionDetails extends StatelessWidget {
  final Evolution evolution;

  const OddEvolutionDetails({Key? key, required this.evolution}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final pokemonController = Provider.of<PokemonController>(context);
    Pokemon pokemon = pokemonController.getPokemon(index: int.parse(evolution.num ?? '0') - 1);

    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
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
                    style: TextStyle(fontSize: 16, fontFamily: 'Google'),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              child: CachedNetworkImage(imageUrl: pokemon.urlImg),
              height: 80,
              width: 80,
            )
          ],
        ),
      ),
    );
  }
}
