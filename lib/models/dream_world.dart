class DreamWorld {
  final String frontDefault;
  final String frontFemale;

  const DreamWorld({
    this.frontDefault = '',
    this.frontFemale = '',
  });

  factory DreamWorld.fromMap(Map<String, dynamic> map) {
    return DreamWorld(
      frontDefault: map['front_default'] ?? '',
      frontFemale: map['front_female'] ?? '',
    );
  }
}
