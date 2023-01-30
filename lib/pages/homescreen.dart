import 'package:flutter/material.dart';
import 'package:toonflix_dg_again/models/webtoon_info.dart';
import 'package:toonflix_dg_again/services/service_api.dart';

import '../widgets/listview_webtoon.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  Future<List<WebtoonInfo>> webtoonsInfoList =
      ServiceApi.getTodayWebtoonsList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("오늘의 웹툰"),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      body: FutureBuilder(
          future: webtoonsInfoList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                  children: [
                    // ListView.separated
                    Expanded(
                      child: ListViewWebtoon(listofWebtoons: snapshot.data!),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
