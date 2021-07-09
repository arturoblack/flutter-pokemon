import 'package:flutter/material.dart';
import 'package:flutter_demo/data/models/pokemon.dart';
import 'package:flutter_demo/data/services/pokemon.service.dart';
import 'package:flutter_demo/widgets/loadingCard.dart';

class PkmnInfo extends StatefulWidget {
  int pkmnNumber;
  PkmnInfo(this.pkmnNumber);

  @override
  _PkmnInfoState createState() => _PkmnInfoState(pkmnNumber);
}

class _PkmnInfoState extends State<PkmnInfo> {
  int pkmnNumber;
  String state = 'loading';
  PokemonInfo? pkmn;
  _PkmnInfoState(this.pkmnNumber);

  @override
  void initState() {
    super.initState();
    PokemonService service = PokemonService();
    service.getPokemon(pkmnNumber: pkmnNumber).then((value) {
      setState(() {
        pkmn = value;
        state = 'done';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case 'done':
        return _pkmCard(pkmn as PokemonInfo);
      case 'loading':
      default:
        return LoadingCard();
    }
  }

  Widget _pkmCard(PokemonInfo pkmn) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                pkmn.imageUrl,
                width: 160,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pkmn.name,
                    style: TextStyle(fontSize: 22),
                  ),
                  Row(
                    children: pkmn.types
                        .map<Widget>((e) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(e.type.name),
                            ))
                        .toList(),
                  ),
                ],
              )
            ],
          ),
          Card(
            child: Row(
              children: [
                _sprite(pkmn.sprites.frontDefault),
                _sprite(pkmn.sprites.backDefault),
                _sprite(pkmn.sprites.frontFemale),
                _sprite(pkmn.sprites.backFemale),
                _sprite(pkmn.sprites.frontShiny),
                _sprite(pkmn.sprites.backShiny),
                _sprite(pkmn.sprites.frontShinyFemale),
                _sprite(pkmn.sprites.backShinyFemale),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sprite(String? sprite) {
    return Container(
      child: sprite != null
          ? Image.network(
              sprite,
              width: 80,
            )
          : Text(''),
    );
  }
}
