import 'package:youtube_playlist_fetcher/data/model/playlist_item.dart';

abstract class Repository{
  Future<List<PlaylistItem>> fetchPlayListItems();
}