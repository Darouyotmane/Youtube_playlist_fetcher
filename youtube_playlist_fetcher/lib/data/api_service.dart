import 'package:http/http.dart';
import 'package:youtube_playlist_fetcher/app/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'model/playlist_item.dart';

class ApiService{
  final  Map<String, dynamic>? queryParameters = {
    'part': Constants.PART,
    'playlistId': Constants.PLAYLIST_ID,
    'key': Constants.API_KEY,
  };


  Future<Response> fetchPlaylistItems() async {
    var url =
    Uri.https(Constants.BASE_URL_YOUTUBE_DATA, Constants.END_POINT_YOUTUBE_DATA, queryParameters);
    Response  response =  await http.get(url);
    Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
    PlaylistItem.fromJson(jsonResponse).items.forEach((element) {

    print('title-> ${element.snippet.title}');
    });

    return response;

  }
}