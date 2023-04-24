import 'package:youtube_playlist_fetcher/app/constants.dart';
import 'package:youtube_playlist_fetcher/data/api_service.dart';
import 'package:youtube_playlist_fetcher/data/model/playlist_item.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:youtube_playlist_fetcher/data/model/playlist_item.dart';

abstract class RemoteDataSource{
  Future<List<Snippet>> fetchPlayListItems();
}
class RemoteDataSourceImp implements RemoteDataSource{

  @override
  Future<List<Snippet>> fetchPlayListItems() async {
    List<Snippet> snippet = [];
    ApiService apiService = ApiService();
    apiService.fetchPlaylistItems();

    var response = await apiService.fetchPlaylistItems();

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      PlaylistItem.fromJson(jsonResponse).items.forEach((element) {
        snippet.add(element.snippet);
        print('title-> ${element.snippet.title}');
      });
      return snippet;

    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }

}
