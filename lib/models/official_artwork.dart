class OfficialArtwork {
  final String frontDefault;

  const OfficialArtwork({
    this.frontDefault = '',
  });

  factory OfficialArtwork.fromMap(Map<String, dynamic> map) {
    return OfficialArtwork(
      frontDefault: map['front_default'] ?? '',
    );
  }
}
