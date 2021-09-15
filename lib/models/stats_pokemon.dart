import 'package:pokedex/models/form_pokemon.dart';

class Stats {
  final int baseStat;
  final int effort;
  final NameUrl stat;

  Stats({
    this.baseStat = 0,
    this.effort = 0,
    this.stat = const NameUrl(),
  });

  factory Stats.fromMap(Map<String, dynamic> map) {
    return Stats(
      baseStat: map['base_stat'] ?? 0,
      effort: map['effort'] ?? 0,
      stat: map['stat'] == null ? NameUrl() : NameUrl.fromMap(map),
    );
  }
}
