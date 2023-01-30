class WebtoonEpisode {
  String thumb, id, title, rating, date, webtoonid;

//   WebtoonInfo({required this.title, required this.thumb, required this.id});
// }
  WebtoonEpisode.fromJson({
    required Map<String, dynamic> json,
    required String wid,
  })  : thumb = json['thumb'],
        id = json['id'],
        title = json['title'],
        rating = json['rating'],
        date = json['date'],
        webtoonid = wid;
}
