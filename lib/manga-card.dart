import 'package:flutter/material.dart';
import 'package:manga_flutter/manga-detail.dart';
import 'package:manga_flutter/manga.dart';

class MangaCard extends StatelessWidget {
  MangaCard({this.manga});

  final Manga manga;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MangaDetail(manga: manga)));
            },
            child: Column(
              children: <Widget>[
                Hero(
                    tag: 'manga-' + manga.name,
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset('manga.png'),
                    )),
                Container(alignment: Alignment.center, child: Text(manga.name))
              ],
            )));
  }
}
