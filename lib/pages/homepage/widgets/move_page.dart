import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/move_pokemon.dart';
import 'package:pokedex/models/pokemon_details_model.dart';
import 'package:pokedex/stores/pokemon_controller.dart';
import 'package:provider/provider.dart';

class MovePokemon extends StatelessWidget {
  const MovePokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PokemonController pokeController = Provider.of<PokemonController>(context);
    return Observer(
      builder: (context) {
        return ListView.builder(
          itemCount: pokeController.movesFiltered.length,
          itemBuilder: (context, index) {
            Move move = pokeController.movesFiltered[index];
            return Container(
              height: 50,
              width: 50,
              child: Row(
                children: [
                  Text(
                    move.versionGroupDetails[0].levelLearnedAt.toString(),
                    style: TextStyle(fontSize: 16, fontFamily: 'Google'),
                  ),
                  Icon(Icons.local_hospital_rounded),
                  Icon(Icons.forward),
                  Text(
                    move.moveLearnMethodDoVitor,
                    style: TextStyle(fontSize: 16, fontFamily: 'Google'),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      move.move.name,
                      style: TextStyle(fontSize: 16, fontFamily: 'Google'),
                    ),
                  ),
                  Icon(Icons.forward)
                ],
              ),
            );
          },
        );
      },
    );
  }
}
