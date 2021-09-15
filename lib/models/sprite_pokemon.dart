class Sprite {
  final String backDefault;
  final String backFemale;
  final String backShiny;
  final String backShinyFemale;
  final String frontDefault;
  final String frontFemale;
  final String frontShiny;
  final String frontShinyFemale;

  Sprite({
    this.backDefault = '',
    this.backFemale = '',
    this.backShiny = '',
    this.backShinyFemale = '',
    this.frontDefault = '',
    this.frontFemale = '',
    this.frontShiny = '',
    this.frontShinyFemale = '',
  });

  factory Sprite.fromMap(Map<String, dynamic> map) {
    return Sprite(
      backDefault: map['back_default'] ?? '',
      backFemale: map['back_female'] ?? '',
      backShiny: map['back_shiny'] ?? '',
      backShinyFemale: map['back_shiny_female'] ?? '',
      frontDefault: map['front_default'] ?? '',
      frontFemale: map['front_female'] ?? '',
      frontShiny: map['front_shiny'] ?? '',
      frontShinyFemale: map['front_shiny_female'] ?? '',
    );
  }
}
