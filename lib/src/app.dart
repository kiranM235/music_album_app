import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:music_albums/src/models/music_album_model.dart';
import 'package:music_albums/src/widgets/music_album_list.dart';


class App extends StatefulWidget {
  AppState createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<AlbumModel> albumList = [];


  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Music Albums",
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Albums"),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: fetchAlbums,

            child: Icon(Icons.add),
          ),
          body: AlbumList(albumList),
        ),
      ),
    );
  }
  void fetchAlbums() async {
    counter ++;
    var url = Uri.parse("https://places-2021-broadway.herokuapp.com/api/albums/$counter");
    var response = await get(url);

    Map<String,dynamic> body = jsonDecode(response.body);

    var albumModel = AlbumModel.fromJson(body);

    setState(() {
      albumList.add(albumModel);
    });
  }
}
