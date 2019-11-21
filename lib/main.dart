import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manga_flutter/manga-list.dart';
import 'package:manga_flutter/manga.dart';
import 'package:http/http.dart' as http;

Future<List<Manga>> fetchManga() async {
  final response = await http.get('http://webarranco.fr:1208/mangas/all');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    var rawMangas = json.decode(response.body) as List<dynamic>;
    return rawMangas.map((rawManga) => Manga.fromJson(rawManga)).toList();
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load mangas');
  }
}

void main() => runApp(MyApp(
      getMangas: fetchManga(),
    ));

class MyApp extends StatelessWidget {
  final Future<List<Manga>> getMangas;

  MyApp({Key key, this.getMangas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Manga Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
        ),
        home: FutureBuilder(
          future: getMangas,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MangaList(allMangas: snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ));
  }
}
