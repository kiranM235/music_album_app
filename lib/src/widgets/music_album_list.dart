import 'package:flutter/material.dart';
import 'package:music_albums/src/models/music_album_model.dart';
import 'package:url_launcher/url_launcher.dart';


class AlbumList extends StatelessWidget {
  final List<AlbumModel> albumList;

  AlbumList(this.albumList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return buildAlbum(albumList[index]);
      },
      itemCount: albumList.length,
    );
  }

  Widget buildAlbum(AlbumModel albumModel) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.network(albumModel.image, width: 40, height: 40,),
                SizedBox(width: 20,),
                Column(
                  children: [
                    Title(color: Colors.green, child: Text(albumModel.title, style: TextStyle(fontWeight: FontWeight.bold),)),
                    SizedBox(height: 5,),
                    Title(color: Colors.green, child: Text(albumModel.artist)),
                  ],
                )
              ],
            ), SizedBox(height: 20),
            Image.network(albumModel.thumbnail),
            SizedBox(height: 5),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Column(
                  children: [
                    Text("Buy Now"),
                  ],
                ),
                onPressed: (){
                  _launchURL(albumModel);
                },
              ),
            ),
          ],

        ),
      ),
    );
  }


  _launchURL(AlbumModel albumModel) async {
    final url = albumModel.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}