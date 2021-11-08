import 'package:flutter/material.dart';
import 'package:test/repositories/poke_repository.dart';
import 'package:test/model/poke_model.dart';

class PokemonDisplay extends StatelessWidget {
  const PokemonDisplay({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  pokeImage() => SizedBox(width: 100, child: Image.network(pokemon.imageUrl));

  pokeInfos() => Center( 
    child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pokemon.name,
              style: const TextStyle(color: Colors.red, fontSize: 25),
            ),
            Text('weight: ${pokemon.weight}'),
            Text('id: ${pokemon.id}'),
          ],
        ),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [pokeImage(), pokeInfos()],
          )),
    );
  }
}
