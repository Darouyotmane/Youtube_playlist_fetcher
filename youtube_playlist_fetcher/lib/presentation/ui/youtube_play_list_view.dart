import 'package:flutter/material.dart';
import 'package:youtube_playlist_fetcher/data/api_service.dart';
import 'package:youtube_playlist_fetcher/presentation/controllers/play_list_items_cubit.dart';
import 'package:youtube_playlist_fetcher/presentation/ressources/colors_manager.dart';
import 'package:youtube_playlist_fetcher/presentation/ui/widgets/body_youtube_play_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YoutubePlayListView extends StatefulWidget {
  const YoutubePlayListView({Key? key}) : super(key: key);

  @override
  State<YoutubePlayListView> createState() => _YoutubePlayListViewState();
}

class _YoutubePlayListViewState extends State<YoutubePlayListView> {
 @override
  void initState() {
   BlocProvider.of<PlayListItemsCubit>(context).fetchPlayListItems();

   //_fetchPlaylistItems();//todo to remove
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text('YouTube PlayList'),
      ),
      body: BodyYoutubePlayList(),
    );
  }
//todo to remove
  /*void _fetchPlaylistItems() async{
    ApiService apiService = ApiService();
    print('responce 00-> ');
    http.Response responce =  await apiService.fetchPlaylistItems();
    print('responce-> ${responce.body}');
  }*/
}



