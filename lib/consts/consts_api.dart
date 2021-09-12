import 'package:flutter/material.dart';

class ConstsAPI {
  static String pokeapiURL = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Color? getColorType({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[200];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.brown;
      case 'Flying':
        return Colors.indigo;
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen;
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.black;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent;
      default:
        return Colors.grey;
    }
  }
}
