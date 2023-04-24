import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:youtube_playlist_fetcher/data/model/playlist_item.dart';
import 'package:youtube_playlist_fetcher/domain/repository/repository.dart';
import 'package:youtube_playlist_fetcher/main.dart';

part 'play_list_items_state.dart';

class PlayListItemsCubit extends Cubit<PlayListItemsState> {
  PlayListItemsCubit() : super(PlayListItemsInitial());
final Repository _repository = getIt();
  Future<void> fetchPlayListItems() async {
    List<Snippet> playlistItems = [];
    try {
      emit(PlayListItemsLoading());
      playlistItems =  await _repository.fetchPlayListItems();
      emit(PlayListItemsSuccess(playlistItems));

    } catch (e) {
      emit(PlayListItemsFailure());
      print(e);
    }
  }
}
