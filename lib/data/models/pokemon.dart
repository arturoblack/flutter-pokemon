class PokemonResume {
  String name;
  String url;

  String get imageUrl {
    String code = this
        .url
        .replaceAll('https://pokeapi.co/api/v2/pokemon', '')
        .replaceAll('/', '');
    return 'https://pokeres.bastionbot.org/images/pokemon/$code.png';
  }

  PokemonResume({
    required this.name,
    required this.url,
  });

  static PokemonResume fromMap(Map<String, dynamic> map) {
    return PokemonResume(
      name: map['name'],
      url: map['url'],
    );
  }
}
