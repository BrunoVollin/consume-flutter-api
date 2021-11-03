import 'package:flutter/material.dart';
import 'package:test/repositories/album_repository.dart';
import 'package:test/model/album_model.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late Album album = Album(userId: -1, id: -1, title: "Undefined");
  AlbumRepository albumRepo = new AlbumRepository();
  int id = 0;

  void getAlbum() async {
    album = await albumRepo.fetchAlbumById(id);
    setState(() {
      album;
    });
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
                "Entre com o Id do Album",
                style: TextStyle(fontSize: 25),
              ),
              Container(height: 20),
              TextField(
                onChanged: (text) {
                  id = int.parse(text);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Album id',
                ),
              ),
              Container(height: 10),
              AlbumDisplay(
                album: album,
              ),
              ElevatedButton(
                onPressed: getAlbum,
                child: const Text(
                  "Procurar Album",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlbumDisplay extends StatefulWidget {
  AlbumDisplay({Key? key, required this.album}) : super(key: key);
  final Album album;

  @override
  _AlbumDisplayState createState() => _AlbumDisplayState();
}

class _AlbumDisplayState extends State<AlbumDisplay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    // width: double.infinity,
                    child: const Text(
                      "Title: ",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                      softWrap: false,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      widget.album.title,
                      // textAlign: TextAlign.center,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      // textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    // width: double.infinity,
                    child: const Text(
                      "Id do Usuario: ",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ),
                  Text(
                    "${widget.album.userId}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    // width: double.infinity,
                    child: const Text(
                      "Id do Album: ",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ),
                  Text(
                    "${widget.album.userId}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
