import 'package:flutter/material.dart';
import 'package:test/repositories/album_repository.dart';
import 'package:test/model/album_model.dart';

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
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
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
  }
}
