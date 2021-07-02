import 'package:flutter/material.dart';
import 'package:flutter_demo/data/models/pokemon.dart';
import 'package:flutter_demo/data/services/pokemon.service.dart';
import 'package:flutter_demo/screens/home/pokemonListCard.dart';
import 'package:flutter_demo/widgets/loadingCard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String status = 'loading';
  List<PokemonResume> pkmns = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola mundo'),
      ),
      body: Container(
        child: PokemonListCard(),
      ),
    );
  }
}
