class NameUrl {
  final String name;
  final String url;

  const NameUrl({
    this.name = '',
    this.url = '',
  });
  factory NameUrl.fromMap(Map<String, dynamic> map) {
    return NameUrl(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }
}
