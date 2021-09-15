import 'package:pokedex/models/form_pokemon.dart';

class Type {
  final int slot;
  final NameUrl type;

  const Type({
    this.slot = 0,
    this.type = const NameUrl(),
  });
  factory Type.fromMap(Map<String, dynamic> map) {
    return Type(
      slot: map['slot'] ?? 0,
      type: map['type'] == null ? NameUrl() : NameUrl.fromMap(map),
    );
  }
}
