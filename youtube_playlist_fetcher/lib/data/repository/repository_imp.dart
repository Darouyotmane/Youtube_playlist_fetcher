import 'package:youtube_playlist_fetcher/data/data_source/remote_data_source.dart';
import 'package:youtube_playlist_fetcher/data/model/playlist_item.dart';
import 'package:youtube_playlist_fetcher/domain/repository/repository.dart';
import 'package:youtube_playlist_fetcher/main.dart';

class RepositoryImp implements Repository{
  RemoteDataSourceImp remoteDataSource =getIt();
  @override
  Future<List<PlaylistItem>> fetchPlayListItems() async{
    return await remoteDataSource.fetchPlayListItems();
  }
}