import 'dart:convert';
import 'package:test/model/album_model.dart';
import 'package:http/http.dart' as http;

class AlbumRepository {
  Future<Album> fetchAlbumById(int id) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'));

    if (response.statusCode == 200) {
      final info = Album.fromJson(jsonDecode(response.body));
      return info;
    } else {
      throw Exception('Failed to load album');
    }
  }
}
