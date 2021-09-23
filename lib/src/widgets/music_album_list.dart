import 'package:flutter/material.dart';
import 'package:music_albums/src/models/music_album_model.dart';

class MusicAlbumList extends StatelessWidget {
  final List<MusicAlbumModel> musicAlbumList;
  const MusicAlbumList(this.musicAlbumList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index){
        return buildMusicAlbum(musicAlbumList[index]);
      },
      itemCount: musicAlbumList.length,
    );
  }
  Widget buildMusicAlbum(MusicAlbumModel musicAlbumModel) {
    return Column(
      children: [
        Image.network(musicAlbumModel.url),
        // Padding(
        //   padding: const EdgeInsets.only(top: 12),
        //   child: Text(musicAlbumModel.title),
        // )
      ],
    );
  }
}

class MusicAlbum {
  static network(String url) {}

}
