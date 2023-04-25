import 'package:youtube_playlist_fetcher/data/data_source/guide_remote_data_source.dart';
import 'package:youtube_playlist_fetcher/data/model/guide_item.dart';
import 'package:youtube_playlist_fetcher/domain/repository/repository.dart';
import 'package:youtube_playlist_fetcher/main.dart';

class GuideRepositoryImp implements GuideRepository{
  GuideRemoteDataSourceImp guideRemoteDataSource =getIt();
  @override
  Future<List<Item>> fetchPlayListItems() async{
    return await guideRemoteDataSource.fetchPlayListItems();
  }
}