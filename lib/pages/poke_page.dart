import 'package:flutter/material.dart';
import 'package:test/pages/poke_display.dart';
import 'package:test/repositories/poke_repository.dart';
import 'package:test/model/poke_model.dart';

class PokePage extends StatefulWidget {
  const PokePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PokePage> createState() => _PokePageState();
}

class _PokePageState extends State<PokePage> {
  Pokemon? pokemon;
  String name = "ditto";

  PokeRepository pokeRepo = PokeRepository();

  getAlbum() async {
    pokemon = await pokeRepo.fetchPokemon(name);
    setState(() {
      pokemon;
    });
    print(pokemon!.showAlbum());
  }

  showPokemon() {
    if (pokemon != null) {
      return PokemonDisplay(pokemon: pokemon!);
    } 
    return const Text("nenhum pokemon");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              const Text(
                "Entre com o nome do Pokémon",
                style: TextStyle(fontSize: 25),
              ),
              Container(height: 20),
              TextField(
                onChanged: (text) {
                  name = text.toLowerCase();
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Album id',
                ),
              ),
              Container(height: 10),
              showPokemon(),
              ElevatedButton(
                onPressed: getAlbum,
                child: const Text(
                  "Procurar Pokemon",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
