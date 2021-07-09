import 'package:flutter_demo/data/models/resume.dart';

class PokemonType {
  int slot;
  Resume type;

  PokemonType({required this.slot, required this.type});

  static PokemonType fromMap(Map<String, dynamic> map) {
    return PokemonType(
      slot: map['slot'],
      type: Resume.fromMap(map['type']),
    );
  }
}
