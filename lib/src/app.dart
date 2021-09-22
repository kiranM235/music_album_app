import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;

import 'package:music_albums/src/models/music_album_model.dart';
import 'package:music_albums/src/widgets/music_album_list.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);


  @override
  AppState createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<MusicAlbumModel> musicAlbumList = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Albums"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            fetchMusicAlbums();
          },
          child: const Icon(Icons.add),
        ),
        body: MusicAlbumList(musicAlbumList),
      ),
    );
  }

  Future<void> fetchMusicAlbums() async {
    counter ++;
    var url = Uri.parse("https://places-2021-broadway.herokuapp.com/api/albums/$counter");
    var response = await get(url);

    var body = jsonDecode(response.body);

    var musicAlbumModel = MusicAlbumModel.fromJson(body);

    setState(() {
      musicAlbumList.add(musicAlbumModel);
    });
  }
}











