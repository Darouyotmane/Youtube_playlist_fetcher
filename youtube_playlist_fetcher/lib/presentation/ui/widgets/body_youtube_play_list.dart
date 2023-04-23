import 'package:flutter/material.dart';
import 'package:youtube_playlist_fetcher/presentation/ui/widgets/youtube_video_item.dart';

class BodyYoutubePlayList extends StatelessWidget {
  const BodyYoutubePlayList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return const YoutubeVideoItem();
      },
    );
  }
}
