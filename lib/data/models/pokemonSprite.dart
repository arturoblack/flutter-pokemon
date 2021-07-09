class PokemonSprite {
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  PokemonSprite({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  static PokemonSprite fromMap(Map<String, dynamic> map) {
    return PokemonSprite(
        backDefault: map['back_default'],
        backFemale: map['back_female'],
        backShiny: map['back_shiny'],
        backShinyFemale: map['back_shiny_female'],
        frontDefault: map['front_default'],
        frontFemale: map['front_female'],
        frontShiny: map['front_shiny'],
        frontShinyFemale: map['front_shiny_female']);
  }
}
