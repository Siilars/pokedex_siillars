import 'package:pokedex/models/poke_model.dart';

main() {
  List<Pokemon> listPokemons = [];

  Pokemon pokemon = Pokemon();
  Pokemon pokemon_ygor = Pokemon();
  Pokemon pokemon_tres = Pokemon();
  Pessoa vitor = Pessoa(name: 'Vitor', idade: 24);

  pokemon = pokemon.copyWith(name: 'Torugo');
  pokemon_ygor = pokemon_ygor.copyWith(name: 'charuzão');
  pokemon_tres = pokemon_tres.copyWith(name: 'mamozuaine');

  listPokemons.add(pokemon);
  listPokemons.add(pokemon_ygor);
  listPokemons.add(pokemon_tres);

  // listPokemons.forEach((poke) {
  //   print(poke.name);
  // });

  // for (final poke in listPokemons) {
  //   print(poke.name);
  //   if (poke.name == 'charuzão') {
  //     break;
  //   }
  // }

  for (int i = 0; i < listPokemons.length; i++) {
    print('posicao => $i');
    print(listPokemons[i].name);
  }
}

class Pessoa {
  String? name;
  int? idade;

  Pessoa({this.name, this.idade});
}
