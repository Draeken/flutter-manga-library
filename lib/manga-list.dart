import 'package:flutter/material.dart';
import 'package:manga_flutter/manga-category.dart';
import 'package:manga_flutter/manga.dart';

class MangaList extends StatelessWidget {
  MangaList({this.allMangas});

  final List<Manga> allMangas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Manga Library')),
        body: Column(children: <Widget>[
          MangaCategory(
            title: 'The Best Shonen',
            mangas: allMangas.where((manga) => manga.type == 'Shonen').toList(),
          ),
          MangaCategory(
            title: 'Seinen Recommandation',
            mangas: allMangas.where((manga) => manga.type == 'Seinen').toList(),
          )
        ]));
  }
}
