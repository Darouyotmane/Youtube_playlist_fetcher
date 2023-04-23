import 'package:youtube_playlist_fetcher/data/model/playlist_item.dart';
import 'package:youtube_playlist_fetcher/main.dart';

abstract class RemoteDataSource{
  Future<List<PlaylistItem>> fetchPlayListItems();
}
class RemoteDataSourceImp implements RemoteDataSource{

  @override
  Future<List<PlaylistItem>> fetchPlayListItems() {

  }

}
