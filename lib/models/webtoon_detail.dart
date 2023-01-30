class WebtoonDetail {
  String title, about, genre, age, thumb;

//   WebtoonInfo({required this.title, required this.thumb, required this.id});
// }
  WebtoonDetail.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'],
        thumb = json['thumb'];
}
