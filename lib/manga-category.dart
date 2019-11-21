import 'package:flutter/material.dart';
import 'package:manga_flutter/manga-card.dart';
import 'package:manga_flutter/manga.dart';

class MangaCategory extends StatelessWidget {
  MangaCategory({this.title, this.mangas});

  final String title;
  final List<Manga> mangas;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 10, 20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children:
                  this.mangas.map((manga) => MangaCard(manga: manga)).toList(),
            ),
          )
        ],
      ),
    );
  }
}
