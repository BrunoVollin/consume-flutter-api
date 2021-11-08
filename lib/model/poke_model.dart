class Pokemon {
  final String name;
  final int id;
  final int weight;
  final String imageUrl;

  Pokemon(
      {required this.name,
      required this.imageUrl,
      required this.id,
      required this.weight});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      id: json['id'],
      weight: json['weight'],
      imageUrl: json['sprites']['front_default'],
    );
  }

  showAlbum() {
    return '''
    {
      name: $name,
      id: $id,
      weight: $weight,
      image: $imageUrl,
    }
    ''';
  }
}
