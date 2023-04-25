import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:youtube_playlist_fetcher/data/model/guide_item.dart';
import 'package:youtube_playlist_fetcher/domain/repository/repository.dart';
import 'package:youtube_playlist_fetcher/main.dart';

part 'guide_items_state.dart';

class GuideItemsCubit extends Cubit<GuideItemsState> {
  GuideItemsCubit() : super(GuideItemsInitial());
final GuideRepository _repository = getIt();
  Future<void> fetchPlayListItems() async {
    List<Item> playlistItems = [];
    try {
      emit(GuideItemsLoading());
      playlistItems =  await _repository.fetchPlayListItems();
      List<Snippet> snippetList =[];
      List<ContentDetails> contentDetailsList=[];
      playlistItems.forEach((element) {
        snippetList.add(element.snippet);
        contentDetailsList.add(element.contentDetails);
      });
      emit(GuideItemsSuccess(snippetList,contentDetailsList));

    } catch (e) {
      emit(PlayListItemsFailure());
      print(e);
    }
  }
}
