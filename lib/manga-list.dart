import 'package:flutter/material.dart';
import 'package:manga_flutter/manga-detail.dart';
import 'package:manga_flutter/manga.dart';

class MangaList extends StatelessWidget {
  MangaList({this.allMangas});

  final List<Manga> allMangas;
  final List<Manga> _displayedMangas = [];

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(children: <Widget>[
      Column(
        children: <Widget>[
          Text('Best Shonen'),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: this
                  .allMangas
                  .map((manga) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MangaDetail(manga: manga)));
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(manga.name))))
                  .toList(),
            ),
          )
        ],
      )
    ]));
  }
}
