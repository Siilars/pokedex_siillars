import 'package:pokedex/models/form_pokemon.dart';

class VersionGroupDetail {
  final int levelLearnedAt;
  final NameUrl moveLearnMethod;
  final NameUrl versionGroup;

  VersionGroupDetail({
    this.levelLearnedAt = 0,
    this.moveLearnMethod = const NameUrl(),
    this.versionGroup = const NameUrl(),
  });
  factory VersionGroupDetail.fromMap(Map<String, dynamic> map) {
    return VersionGroupDetail(
        levelLearnedAt: map['level_learned_at'] ?? 0,
        moveLearnMethod: map['move_learn_method'] == null ? NameUrl() : NameUrl.fromMap(map['move_learn_method']),
        versionGroup: map['version_group'] == null ? NameUrl() : NameUrl.fromMap(map['version_group']));
  }
}
