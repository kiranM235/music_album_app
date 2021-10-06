class AlbumModel {
  late String title;
  late String url;
  late int id;
  late String image;
  late String thumbnail;
  late String artist;

  AlbumModel(this.title, this.url, this.id, this.image, this.thumbnail);

  AlbumModel.fromJson(Map<String, dynamic> mapData) {
    title = mapData["title"];
    id = mapData["id"];
    url = mapData["url"];
    image = mapData["image"];
    thumbnail = mapData["thumbnail"];
    artist = mapData["artist"];
  }
}
