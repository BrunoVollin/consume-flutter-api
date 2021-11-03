import 'package:flutter/material.dart';
import 'package:test/pages/album_page.dart';

class AlbumApp extends StatelessWidget {
  const AlbumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consumindo API Rest no Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AlbumPage(title: 'Buscando Album pelo Id'),
    );
  }
}
