import 'package:flutter/material.dart';
import 'package:flutter_demo/screens/pokemon/pkmInfo.dart';

class PokemonInfoScreen extends StatelessWidget {
  int pkmNumber;
  PokemonInfoScreen(this.pkmNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información del pokemon #$pkmNumber'),
      ),
      body: PkmnInfo(pkmNumber),
    );
  }
}
