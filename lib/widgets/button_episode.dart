import 'package:flutter/material.dart';
import 'package:toonflix_dg_again/models/webtoon_episode.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonEpisode extends StatelessWidget {
  WebtoonEpisode episode;

  ButtonEpisode({
    super.key,
    required this.episode,
  });

  void ontapEpisodeButton({
    context,
  }) async {
    final Uri url = Uri.parse(
        'https://comic.naver.com/webtoon/detail?titleId=${episode.webtoonid}&no=${episode.id}');

    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontapEpisodeButton(context: context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Theme.of(context).cardColor, width: 5),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(5, 5),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                episode.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
            )
          ],
        ),
      ),
    );
  }
}
