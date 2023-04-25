import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:youtube_playlist_fetcher/data/model/guide_item.dart';
import 'package:youtube_playlist_fetcher/presentation/controllers/guide_items_cubit.dart';
import 'package:youtube_playlist_fetcher/presentation/ui/widgets/custom_error_widget.dart';
import 'package:youtube_playlist_fetcher/presentation/ui/widgets/custom_louading_widget.dart';
import 'package:youtube_playlist_fetcher/presentation/ui/widgets/youtube_video_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyGuideScreen extends StatelessWidget {
  const BodyGuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuideItemsCubit,GuideItemsState>(builder: (context,state){
      if(state is GuideItemsSuccess ) {
        List<Snippet> snippetList = state.snippetList;
        List<ContentDetails> contentDetailsList = state.contentDetailsList;
        return  ListView.builder(
          itemCount: snippetList.length,
          itemBuilder: (BuildContext context, int index) {
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: YoutubeVideoItem(snippetList[index],contentDetailsList[index]),
            );
          },
        );
      }
      else if (state is GuideItemsLoading) {
        return const CustomLoadingWidget();
      }
      else {
        return const CustomErrorWidget();
      }
    },);
  }
}
