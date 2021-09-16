import 'package:pokedex/models/poke_model.dart';

void printCarteiraNameMaisListaDePokebons(Carteira cart) {
  cart.listPokemon.forEach((poke) {
    print('${cart.nome} É dono  do ${poke.name}');
  });
}

void tradeAll({required Carteira carteiraFrom, required Carteira carteiraTo}) {
  List<Pokemon> pokeSave = [];
  pokeSave.addAll(carteiraFrom.listPokemon);
  carteiraFrom.listPokemon.clear();
  carteiraTo.listPokemon.addAll(pokeSave);
}

void tradeInstantaneo({required Carteira carteiraFrom, required Carteira carteiraTo, required Pokemon pokemon}) {
  // for (final poke in carteiraFrom.listPokemon.toList()) {
  //   if (poke.name == pokemon.name) {
  //     print('Realizando trade de ${poke.name}');
  //     carteiraFrom.listPokemon.remove(pokemon);
  //     carteiraTo.listPokemon.add(pokemon);
  //   }
  // }
  if (carteiraFrom.listPokemon.contains(pokemon)) {
    print('Realizando trade de ${pokemon.name}');
    carteiraFrom.listPokemon.remove(pokemon);
    carteiraTo.listPokemon.add(pokemon);
  }
}

Pokemon changeName({required Pokemon pokemon, required String newName}) {
  pokemon = pokemon.copyWith(name: newName);
  return pokemon;
}

main() {
  Carteira carteiraVito = Carteira(nome: 'Siilão', saldo: -2000, documentos: [], listCard: [], listPokemon: []);
  Carteira carteiraYgo = Carteira(nome: 'Ygu', saldo: 2000, documentos: [], listCard: [], listPokemon: []);
  Pokemon blastoise = Pokemon(name: 'Blastoide', id: 8);
  Pokemon mamoswine = Pokemon(name: 'Mamute Pequenino', id: 9);
  Pokemon snorlax = Pokemon(name: 'Snorlax', id: 10);

  carteiraVito.listPokemon.addAll([blastoise, mamoswine]);
  carteiraYgo.listPokemon.add(snorlax);

  tradeAll(carteiraFrom: carteiraVito, carteiraTo: carteiraYgo);

  carteiraYgo.listPokemon[2] = changeName(pokemon: carteiraYgo.listPokemon[2], newName: 'mamasuaine');

  printCarteiraNameMaisListaDePokebons(carteiraVito);
  printCarteiraNameMaisListaDePokebons(carteiraYgo);
  //
  // tradeInstantaneo(carteiraFrom: carteira, carteiraTo: carteiraDois, pokemon: mamoswine);
  // tradeInstantaneo(carteiraFrom: carteira, carteiraTo: carteiraDois, pokemon: mamoswine);
  //
  // printCarteiraNameMaisListaDePokebons(carteira);
  // printCarteiraNameMaisListaDePokebons(carteiraDois);

  // double mandaPix = 375;
  // carteira.listCard.add('Elo');
  // carteira.listCard.add('Caixa');
  // carteira.listCard.add('MasterCard');
  //
  //carteira.listCard.forEach((card) {
  //   print(card);
  //   if (card == 'Caixa') {
  //     carteira.saldo = carteira.saldo + mandaPix;
  //     print(carteira.saldo);
  //   }
  // });
  //
  // carteira.saldo = 1500 + carteira.saldo.toDouble();
  // print(carteira.saldo);
  //
  // carteira.saldo = 200 + carteira.saldo.toDouble();
  // print(carteira.saldo);
  //
  // carteiraDois.saldo = carteiraDois.saldo - mandaPix;
  // carteira.saldo = mandaPix + carteira.saldo;
  // print('Carteira do ${carteira.nome} ${carteira.saldo} ');
  //print('Carteira do ${carteiraDois.nome} ${carteiraDois.saldo} ');
}

class Carteira {
  double saldo;
  String nome;
  List<String> documentos;
  List<String> listCard;
  List<Pokemon> listPokemon;

  Carteira({
    this.saldo = 0.0,
    this.nome = '',
    required this.documentos,
    required this.listCard,
    required this.listPokemon,
  });
}
