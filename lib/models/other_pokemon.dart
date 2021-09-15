import 'package:flutter/services.dart';
import 'package:pokedex/models/dream_world.dart';
import 'package:pokedex/models/official_artwork.dart';

class Other {
  final OfficialArtwork officialArtwork;
  final DreamWorld dreamWorld;

  Other({
    this.officialArtwork = const OfficialArtwork(),
    this.dreamWorld = const DreamWorld(),
  });

  factory Other.fromMap(Map<String, dynamic> map) {
    return Other(
      officialArtwork: map['official-artwork'] == null ? OfficialArtwork() : OfficialArtwork.fromMap(map),
      dreamWorld: map['dream_world'] == null ? DreamWorld() : DreamWorld.fromMap(map),
    );
  }
}
