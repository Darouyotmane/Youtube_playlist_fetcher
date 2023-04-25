import 'package:youtube_playlist_fetcher/data/model/guide_item.dart';

abstract class GuideRepository{
  Future<List<Item>> fetchPlayListItems();
}