import 'package:pokedex/models/form_pokemon.dart';

class GameIndex {
  final int gameIndex;
  final NameUrl version;

  GameIndex({
    this.gameIndex = 0,
    this.version = const NameUrl(),
  });
  factory GameIndex.fromMap(Map<String, dynamic> map) {
    return GameIndex(
      gameIndex: map['game_index'] ?? 0,
      version: map['version'] == null ? NameUrl() : NameUrl.fromMap(map),
    );
  }
}
