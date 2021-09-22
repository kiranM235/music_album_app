class MusicAlbumModel {
  late String title;
  late String artist;
  late String image;
  late String thumbnail;
  late String url;


  MusicAlbumModel(this.title, this.artist, this.image, this.thumbnail, this.url);

  MusicAlbumModel.fromJson(Map<dynamic, dynamic> mapData) {
    title = mapData["title"];
    artist = mapData["artist"];
    image = mapData["image"];
    thumbnail = mapData["thumbnail"];
    url = mapData["url"];
  }
}
