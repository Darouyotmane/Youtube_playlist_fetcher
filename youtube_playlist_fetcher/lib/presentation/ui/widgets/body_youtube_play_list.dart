import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:youtube_playlist_fetcher/data/model/playlist_item.dart';
import 'package:youtube_playlist_fetcher/presentation/controllers/play_list_items_cubit.dart';
import 'package:youtube_playlist_fetcher/presentation/ui/widgets/youtube_video_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyYoutubePlayList extends StatelessWidget {
  const BodyYoutubePlayList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PlayListItemsCubit,PlayListItemsState>(builder: (context,state){
      if(state is PlayListItemsSuccess ) {
        List<Snippet> snippet = state.playlistItems;
        return ListView.builder(
          itemCount: snippet.length,
          itemBuilder: (BuildContext context, int index) {
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: YoutubeVideoItem(snippet[index]),
            );
          },
        );
      }
      else
        return Container();
    },);


  }
}
