import 'package:pokedex/models/form_pokemon.dart';
import 'package:pokedex/models/version_group_details.dart';

class Move {
  final NameUrl move;
  final String moveLearnMethodDoVitor;
  final List<VersionGroupDetail> versionGroupDetails;

  bool get isLvlUp => versionGroupDetails.any((element) => element.moveLearnMethod.name == 'level-up');
  bool get isTutor => versionGroupDetails.any((element) => element.moveLearnMethod.name == 'tutor');

  Move({
    this.move = const NameUrl(),
    this.versionGroupDetails = const <VersionGroupDetail>[],
    this.moveLearnMethodDoVitor = '',
  });
  factory Move.fromMap(Map<String, dynamic> map) {
    return Move(
      move: map['move'] == null ? NameUrl() : NameUrl.fromMap(map['move']),
      versionGroupDetails: map['version_group_details'] == null ? <VersionGroupDetail>[] : (map['version_group_details'] as List).map((e) => VersionGroupDetail.fromMap(e)).toList(),
    );
  }
}
