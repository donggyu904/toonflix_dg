import 'package:flutter/material.dart';
import 'package:toonflix_dg_again/models/webtoon_info.dart';

import '../pages/detailscreen.dart';

class ListViewWebtoon extends StatelessWidget {
  // List<WebtoonInfo> listofWebtoons;

  final List<WebtoonInfo> listofWebtoons;

  const ListViewWebtoon({
    super.key,
    required this.listofWebtoons,
  });

  void ontapWebtoonImg({context, webtoonInfo}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Detailscreen(
          webtoonInfo: webtoonInfo,
        ),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: listofWebtoons.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                ontapWebtoonImg(
                    context: context, webtoonInfo: listofWebtoons[index]);
              },
              child: Hero(
                tag: listofWebtoons[index].id,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 300,
                  // color: Colors.yellow,
                  child: Image.network(
                    listofWebtoons[index].thumb,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              listofWebtoons[index].title,
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 20,
        );
      },
    );
  }
}
