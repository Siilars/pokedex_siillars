import 'package:flutter/cupertino.dart';
import 'package:pokedex/models/abilities_pokemon.dart';
import 'package:pokedex/models/form_pokemon.dart';
import 'package:pokedex/models/game_indices.dart';
import 'package:pokedex/models/move_pokemon.dart';
import 'package:pokedex/models/stats_pokemon.dart';
import 'package:pokedex/models/type_pokemon.dart';

class PokeDetail {
  final List<Ability> abilities;
  final int baseExperience;
  final List<NameUrl> forms;
  final List<GameIndex> gameIndices;
  final int height;
  final int id;
  final bool isDefault;
  final String areaEncounters;
  final List<Move> moves;
  final String name;
  final int order;
  final NameUrl species;
  final List<Stats> stats;
  final int weight;
  final List<Type> types;

  PokeDetail({
    this.abilities = const <Ability>[],
    this.baseExperience = 0,
    this.forms = const <NameUrl>[],
    this.gameIndices = const <GameIndex>[],
    this.height = 0,
    this.id = 0,
    this.isDefault = false,
    this.areaEncounters = '',
    this.moves = const <Move>[],
    this.name = '',
    this.order = 0,
    this.species = const NameUrl(),
    this.stats = const <Stats>[],
    this.weight = 0,
    this.types = const <Type>[],
  });

  factory PokeDetail.fromMap(Map<String, dynamic> map) {
    return PokeDetail(
      abilities: map['abilities'] == null ? <Ability>[] : (map['abilities'] as List).map((e) => Ability.fromMap(e)).toList(),
      baseExperience: map['base_experience'] ?? 0,
      forms: map['forms'] == null ? <NameUrl>[] : (map['forms'] as List).map((e) => NameUrl.fromMap(e)).toList(),
      gameIndices: map['game_indices'] == null ? <GameIndex>[] : (map['game_indices'] as List).map((e) => GameIndex.fromMap(e)).toList(),
      height: map['height'] ?? 0,
      id: map['id'] ?? 0,
      isDefault: map['is_default'] ?? false,
      areaEncounters: map['location_area_encounters'] ?? '',
      moves: map['moves'] == null ? <Move>[] : (map['moves'] as List).map((e) => Move.fromMap(e)).toList(),
      name: map['name'] ?? '',
      order: map['order'] ?? 0,
      species: map['species'] == null ? NameUrl() : NameUrl.fromMap(map),
      stats: map['stats'] == null ? <Stats>[] : (map['stats'] as List).map((e) => Stats.fromMap(e)).toList(),
      weight: map['weight'] ?? 0,
      types: map['types'] == null ? <Type>[] : (map['types'] as List).map((e) => Type.fromMap(e)).toList(),
    );
  }
}
