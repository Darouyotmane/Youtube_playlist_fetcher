import 'package:flutter/material.dart';
import 'package:youtube_playlist_fetcher/data/api_service.dart';
import 'package:youtube_playlist_fetcher/presentation/controllers/guide_items_cubit.dart';
import 'package:youtube_playlist_fetcher/presentation/ressources/colors_manager.dart';
import 'package:youtube_playlist_fetcher/presentation/ui/widgets/body_guide_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GuideScreen extends StatefulWidget {
  const GuideScreen({Key? key}) : super(key: key);

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
 @override
  void initState() {
   BlocProvider.of<GuideItemsCubit>(context).fetchPlayListItems();

   //_fetchPlaylistItems();//todo to remove
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text('YouTube Data Api PlaylistItems'),
      ),
      body: BodyGuideScreen(),
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



