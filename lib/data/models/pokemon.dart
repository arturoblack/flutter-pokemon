import 'package:flutter_demo/data/models/pokemonSprite.dart';
import 'package:flutter_demo/data/models/type.dart';

class PokemonResume {
  String name;
  String url;

  int get number {
    String code = this
        .url
        .replaceAll('https://pokeapi.co/api/v2/pokemon', '')
        .replaceAll('/', '');
    return int.tryParse(code) ?? 0;
  }

  String get imageUrl {
    return 'https://pokeres.bastionbot.org/images/pokemon/$number.png';
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

class PokemonInfo {
  int weight;
  String name;
  int order;
  int height;
  int id;
  bool isDefault;
  int baseExperience;
  List<PokemonType> types;
  PokemonSprite sprites;

  PokemonInfo({
    required this.weight,
    required this.name,
    required this.order,
    required this.height,
    required this.id,
    required this.isDefault,
    required this.baseExperience,
    required this.types,
    required this.sprites,
  });

  String get imageUrl {
    return 'https://pokeres.bastionbot.org/images/pokemon/$id.png';
  }

  static PokemonInfo fromMap(Map<String, dynamic> map) {
    return PokemonInfo(
      weight: map['weight'],
      name: map['name'],
      order: map['order'],
      height: map['height'],
      id: map['id'],
      isDefault: map['is_default'],
      baseExperience: map['base_experience'],
      types:
          map['types'].map<PokemonType>((t) => PokemonType.fromMap(t)).toList(),
      sprites: PokemonSprite.fromMap(map['sprites']),
    );
  }
}
