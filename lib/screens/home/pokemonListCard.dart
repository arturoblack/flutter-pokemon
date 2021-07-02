import 'package:flutter/material.dart';
import 'package:flutter_demo/data/models/pokemon.dart';
import 'package:flutter_demo/data/services/pokemon.service.dart';

class PokemonListCard extends StatefulWidget {
  @override
  _PokemonListCardState createState() => _PokemonListCardState();
}

class _PokemonListCardState extends State<PokemonListCard> {
  PokemonService pkmService = PokemonService();
  List<PokemonResume> pkmns = [];
  final int limit = 10;
  int offset = 0;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print('SC ------> ${_scrollController.position.pixels}');
      print('SCMAX----> ${_scrollController.position.maxScrollExtent}');
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        loadPkmns();
      }
    });
    loadPkmns();
  }

  void loadPkmns() {
    pkmService.listPokemon(limit: limit, offset: offset).then((pkmns) {
      print(pkmns);
      setState(() {
        this.offset += this.limit;
        this.pkmns.addAll(pkmns);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: pkmns.length,
        itemBuilder: (_, index) {
          return _pknCard(pkmns[index]);
        },
      ),
    );
  }

  Widget _pknCard(PokemonResume pkmn) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Image.network(
                pkmn.imageUrl,
                width: 60,
              ),
              // Text(pkmn.imageUrl),
              SizedBox(width: 16),
              Text(
                pkmn.name,
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
