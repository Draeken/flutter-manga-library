import 'package:flutter/material.dart';
import 'package:manga_flutter/manga.dart';

class MangaDetail extends StatelessWidget {
  MangaDetail({this.manga});

  final Manga manga;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Text(manga.name),
    );
  }
}
