import 'dart:convert';
import 'package:test/model/poke_model.dart';
import 'package:http/http.dart' as http;

class PokeRepository {
  Future<Pokemon> fetchPokemon(String name) async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));

    if (response.statusCode == 200) {
      final info = Pokemon.fromJson(jsonDecode(response.body));
      return info;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
