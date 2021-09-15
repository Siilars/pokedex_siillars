import 'package:pokedex/models/form_pokemon.dart';
import 'package:pokedex/models/version_group_details.dart';

class Move {
  final NameUrl move;
  final List<VersionGroupDetail> versionGroupDetails;

  Move({
    this.move = const NameUrl(),
    this.versionGroupDetails = const <VersionGroupDetail>[],
  });
  factory Move.fromMap(Map<String, dynamic> map) {
    return Move(
      move: map['move'] == null ? NameUrl() : NameUrl.fromMap(map),
      versionGroupDetails: map['version_group_details'] == null ? <VersionGroupDetail>[] : (map['version_group_details'] as List).map((e) => VersionGroupDetail.fromMap(e)).toList(),
    );
  }
}
