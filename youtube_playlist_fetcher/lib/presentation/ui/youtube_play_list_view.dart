import 'package:flutter/material.dart';
import 'package:youtube_playlist_fetcher/presentation/managers/my_colors.dart';
import 'package:youtube_playlist_fetcher/presentation/managers/my_values.dart';
import 'package:youtube_playlist_fetcher/presentation/ui/widgets/body_youtube_play_list.dart';

class YoutubePlayListView extends StatelessWidget {
  const YoutubePlayListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube PlayList'),
      ),
      body: BodyYoutubePlayList(),
    );
  }
}



