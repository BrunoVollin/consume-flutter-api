import 'package:flutter/material.dart';
import 'package:test/pages/poke_page.dart';

class PokeApp extends StatelessWidget {
  const PokeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consumindo API Rest no Flutter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const PokePage(title: 'Buscando Pokemon pelo nome'),
    );
  }
}
