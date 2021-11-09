import 'package:flutter/material.dart';
import 'package:test/repositories/poke_repository.dart';
import 'package:test/model/poke_model.dart';

class PokemonDisplay extends StatelessWidget {
  const PokemonDisplay({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  pokeImage() => Stack(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100),
              bottomLeft: Radius.circular(100)
            ),
            color: Colors.red,
          ),
          width: 100,
          height: 100,
        ),
        Positioned.fill(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: Colors.black,
              ),
              width: 65,
              height: 65,
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              width: 50,
              height: 50,
            ),
          ),
        ),
        SizedBox(
          width: 100,
          child: Image.network(pokemon.imageUrl),
        ),
      ]);

  pokeInfos(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                pokemon.name.toUpperCase(),
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              ),
              margin: const EdgeInsets.only(bottom: 5.0),
            ),
            Text('weight: ${pokemon.weight}'),
            Text('id: ${pokemon.id}'),
          ],
        ),
      );

  divider() => Container(
        color: Colors.black,
        width: 10,
        height: 100,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Row(
          children: [pokeImage(), divider(), pokeInfos(context)],
        ),
      ),
    );
  }
}
