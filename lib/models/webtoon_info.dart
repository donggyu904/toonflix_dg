class WebtoonInfo {
  String title, thumb, id;

//   WebtoonInfo({required this.title, required this.thumb, required this.id});
// }
  WebtoonInfo.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
