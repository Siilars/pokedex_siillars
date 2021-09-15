import 'package:pokedex/models/form_pokemon.dart';

class Ability {
  final NameUrl ability;
  final bool isHidden;
  final int slot;

  Ability({
    this.ability = const NameUrl(),
    this.isHidden = false,
    this.slot = 0,
  });
  factory Ability.fromMap(Map<String, dynamic> map) {
    return Ability(
      ability: map['ability'] == null ? NameUrl() : NameUrl.fromMap(map),
      isHidden: map['is_hidden'] = false,
      slot: map['slot'] = 0,
    );
  }
}
