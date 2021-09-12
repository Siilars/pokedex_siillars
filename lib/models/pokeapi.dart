class Pokemon {
  final int id;
  final String num;
  String name;
  final String img;
  final List<String> type;
  final String height;
  final String weight;
  final String candy;
  final int candyCount;
  final String egg;
  final double spawnChance;
  final double avgSpawns;
  final String spawnTime;
  final List<double> multipliers;
  final List<String> weaknesses;
  final List<Evolution> nextEvolution;
  final List<Evolution> prevEvolution;

  Pokemon({
    this.id = 0,
    this.num = '',
    this.name = '',
    this.img = '',
    this.type = const <String>[],
    this.height = '',
    this.weight = '',
    this.candy = '',
    this.candyCount = 0,
    this.egg = '',
    this.spawnChance = 0.0,
    this.avgSpawns = 0.0,
    this.spawnTime = '',
    this.multipliers = const <double>[],
    this.weaknesses = const <String>[],
    this.nextEvolution = const <Evolution>[],
    this.prevEvolution = const <Evolution>[],
  });

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'] ?? 0,
      num: map['num'] ?? '',
      name: map['name'] ?? '',
      img: map['img'] ?? '',
      type: map['type'] == null ? <String>[] : map['type'].cast<String>(),
      height: map['height'] ?? '',
      weight: map['weight'] ?? '',
      candy: map['candy'] ?? '',
      candyCount: map['candyCount'] ?? 0,
      egg: map['egg'] ?? '',
      spawnChance: map['spawnChance'] ?? 0.0,
      avgSpawns: map['avgSpawns'] ?? 0.0,
      spawnTime: map['spawnTime'] ?? '',
      multipliers: map['multipliers'] == null ? <double>[] : map['multipliers'].cast<double>(),
      weaknesses: map['weaknesses'] == null ? <String>[] : map['weaknesses'].cast<String>(),
      nextEvolution: map['nextEvolution'] == null ? <Evolution>[] : (map['nextEvolution'] as List).map((e) => Evolution.fromMap(e)).toList(),
      prevEvolution: map['prevEvolution'] == null ? <Evolution>[] : (map['prevEvolution'] as List).map((e) => Evolution.fromMap(e)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'num': this.num,
      'name': this.name,
      'img': this.img,
      'type': this.type,
      'height': this.height,
      'weight': this.weight,
      'candy': this.candy,
      'candyCount': this.candyCount,
      'egg': this.egg,
      'spawnChance': this.spawnChance,
      'avgSpawns': this.avgSpawns,
      'spawnTime': this.spawnTime,
      'multipliers': this.multipliers,
      'weaknesses': this.weaknesses,
      'nextEvolution': this.nextEvolution,
      'prevEvolution': this.prevEvolution,
    };
  }

  Pokemon copyWith({
    int? id,
    String? num,
    String? name,
    String? img,
    List<String>? type,
    String? height,
    String? weight,
    String? candy,
    int? candyCount,
    String? egg,
    double? spawnChance,
    double? avgSpawns,
    String? spawnTime,
    List<double>? multipliers,
    List<String>? weaknesses,
    List<Evolution>? nextEvolution,
    List<Evolution>? prevEvolution,
  }) {
    return Pokemon(
      id: id ?? this.id,
      num: num ?? this.num,
      name: name ?? this.name,
      img: img ?? this.img,
      type: type ?? this.type,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      candy: candy ?? this.candy,
      candyCount: candyCount ?? this.candyCount,
      egg: egg ?? this.egg,
      spawnChance: spawnChance ?? this.spawnChance,
      avgSpawns: avgSpawns ?? this.avgSpawns,
      spawnTime: spawnTime ?? this.spawnTime,
      multipliers: multipliers ?? this.multipliers,
      weaknesses: weaknesses ?? this.weaknesses,
      nextEvolution: nextEvolution ?? this.nextEvolution,
      prevEvolution: prevEvolution ?? this.prevEvolution,
    );
  }
}

class Evolution {
  final String? num;
  final String? name;

  Evolution({
    this.num = '',
    this.name = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'num': this.num,
      'name': this.name,
    };
  }

  factory Evolution.fromMap(Map<String, dynamic> map) {
    return Evolution(
      num: map['num'] ?? '',
      name: map['name'] ?? '',
    );
  }
}
