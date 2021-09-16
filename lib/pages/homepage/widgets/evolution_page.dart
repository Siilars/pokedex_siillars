import 'package:flutter/material.dart';
import 'package:pokedex/models/poke_model.dart';
import 'package:pokedex/pages/homepage/widgets/even_evolution_detail.dart';
import 'package:pokedex/pages/homepage/widgets/odd_evolution_details.dart';
import 'package:pokedex/stores/pokemon_controller.dart';
import 'package:provider/provider.dart';

class EvolutionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late final PokemonController _pokeApiStore = Provider.of<PokemonController>(context);

    List<Evolution> getEvolution() {
      List<Evolution> _list = [];
      Pokemon pokemon = _pokeApiStore.getPokemonAtual;
      pokemon.prevEvolution.forEach((f) {
        _list.add(f);
      });
      _list.add(Evolution(name: pokemon.name, num: pokemon.num));
      pokemon.nextEvolution.forEach((f) {
        _list.add(f);
      });

      return _list;
    }

    return ListView.builder(
      itemCount: getEvolution().length,
      itemBuilder: (context, index) {
        Evolution evolution = getEvolution()[index];
        if (index.isEven) {
          return EvenEvolutionDetail(
            evolution: evolution,
          );
        } else {
          return OddEvolutionDetails(
            evolution: evolution,
          );
        }
      },
    );
  }
}
