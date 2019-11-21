class Manga {
  final String name;
  final String country;
  final String type;
  final double score;
  final bool hasAnime;
  final bool isFinished;

  Manga(
      {this.name,
      this.country,
      this.type,
      this.score,
      this.hasAnime,
      this.isFinished});

  factory Manga.fromJson(Map<String, dynamic> json) {
    return Manga(
        name: json['_source']['manga']['name'],
        country: json['_source']['manga']['country'],
        type: json['_source']['manga']['type'],
        score: json['_score'].toDouble(),
        hasAnime: json['_source']['manga']['hasAnime'],
        isFinished: json['_source']['manga']['isFinished']);
  }
}
