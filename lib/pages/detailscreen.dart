import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix_dg_again/models/webtoon_detail.dart';
import 'package:toonflix_dg_again/models/webtoon_episode.dart';
import 'package:toonflix_dg_again/models/webtoon_info.dart';
import 'package:toonflix_dg_again/services/service_api.dart';
import 'package:toonflix_dg_again/widgets/button_episode.dart';

class Detailscreen extends StatefulWidget {
  const Detailscreen({
    super.key,
    required this.webtoonInfo,
  });

  final WebtoonInfo webtoonInfo;

  @override
  _DetailscreenState createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  // final WebtoonDetail webtoonDetail;
  late Future<WebtoonDetail> webtoonDetail;
  late Future<List<WebtoonEpisode>> webtoonEpisodeList;
  late SharedPreferences pref;
  late List<String>? likedToons;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    webtoonDetail = ServiceApi.getWebtoonDetailByID(
      widget.webtoonInfo.id,
    );
    webtoonEpisodeList = ServiceApi.getWebtoonEpisodeListByID(
      widget.webtoonInfo.id,
    );
    // inittest();
    initPrefs();
    // print(likedToons);
    // isFavorite = true;
    // print(isFavorite);
    // print(isFavorite);
    // print(isFavorite);

    // print(webtoonEpisode);
    // print(webtoonEpisode);
  }

  // void inittest() {
  //   isFavorite = false;
  // }

  void initPrefs() async {
    pref = await SharedPreferences.getInstance();
    // pref.clear();
    likedToons = pref.getStringList('LikedToons');

    likedToons ??= [];
    // likedToons = [];

    // isFavorite = true;
    if (likedToons!.contains(widget.webtoonInfo.id)) {
      setState(() {
        isFavorite = true;
      });
    }

    // isFavorite = false;
    // print(isFavorite);
  }

  Future<void> ontapFavorite(likedToons) async {
    print(likedToons);
    if (likedToons.contains(widget.webtoonInfo.id)) {
      likedToons.remove(widget.webtoonInfo.id);
      print(likedToons);
    } else {
      likedToons.add(widget.webtoonInfo.id);
      print(likedToons);
    }
    setState(() {
      isFavorite = !isFavorite;
      print(likedToons);
    });

    await pref.setStringList('LikedToons', likedToons);
  }

  // var webtoonDetail = ServiceApi.getWebtoonDetailByID(widget.webtoonInfo.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.webtoonInfo.title), actions: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: () {
                ontapFavorite(likedToons);
                // setState(() {});
              },
              icon: (isFavorite)
                  ? (const Icon(Icons.favorite))
                  : const Icon(Icons.favorite_border),
            ))
      ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: widget.webtoonInfo.id,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  width: 300,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular((20))),
                  child: Image.network(
                    widget.webtoonInfo.thumb,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              FutureBuilder(
                  future: webtoonDetail,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            snapshot.data!.about,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${snapshot.data!.genre}/${snapshot.data!.age}",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FutureBuilder(
                              future: webtoonEpisodeList,
                              builder: (context, snapshot) {
                                return (snapshot.hasData)
                                    ? Column(
                                        children: [
                                          for (WebtoonEpisode episode
                                              in snapshot.data!)
                                            // Text((episode.title))
                                            Column(
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                ButtonEpisode(episode: episode),
                                              ],
                                            ),
                                        ],
                                      )
                                    : const Center(
                                        child: CircularProgressIndicator());
                              })
                        ],
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
