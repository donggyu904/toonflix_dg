import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix_dg_again/models/webtoon_episode.dart';
import 'package:toonflix_dg_again/models/webtoon_info.dart';

import '../models/webtoon_detail.dart';

class ServiceApi {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonInfo>> getTodayWebtoonsList() async {
    /// the data is not loaded.
    var response = await http.get(Uri.parse("$baseUrl/$today"));
    List<WebtoonInfo> webtoonsInfoList = [];

    if (response.statusCode == 200) {
      // webtoonsInfoList.
      var webtoonsListTmp = jsonDecode(response.body);
      for (var webtoonTmp in webtoonsListTmp) {
        // print(webtoonTmp);
        webtoonsInfoList.add(WebtoonInfo.fromJson(webtoonTmp));
        // print(webtoonsInfoList[0].id.runtimeType);
      }
      return webtoonsInfoList;
    }
    throw Error();
  }

  static Future<WebtoonDetail> getWebtoonDetailByID(String id) async {
    /// the data is not loaded.
    var response = await http.get(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      var webtoonTmp = jsonDecode(response.body);
      // print(webtoonTmp);
      // print(webtoonTmp.runtimeType);
      WebtoonDetail webtoonDetail = WebtoonDetail.fromJson(webtoonTmp);
      // List<WebtoonInf> webtoonsList = [];
      // print(webtoonDetail);
      return webtoonDetail;
    }
    throw Error();
  }

  static Future<List<WebtoonEpisode>> getWebtoonEpisodeListByID(
      String id) async {
    /// the data is not loaded.
    var response = await http.get(Uri.parse("$baseUrl/$id/episodes"));
    List<WebtoonEpisode> webtoonEpisodeList = [];

    if (response.statusCode == 200) {
      var webtoonTmp = jsonDecode(response.body);

      for (var episode in webtoonTmp) {
        WebtoonEpisode webtoonEpisode =
            WebtoonEpisode.fromJson(json: episode, wid: id);

        webtoonEpisodeList.add(webtoonEpisode);
      }

      return webtoonEpisodeList;
    }
    throw Error();
  }
}
