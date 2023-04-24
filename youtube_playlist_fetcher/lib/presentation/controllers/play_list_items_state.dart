part of 'play_list_items_cubit.dart';

@immutable
abstract class PlayListItemsState {}

class PlayListItemsInitial extends PlayListItemsState {}
class PlayListItemsLoading extends PlayListItemsState {}
class PlayListItemsSuccess extends PlayListItemsState {
  List<Snippet> playlistItems;
  PlayListItemsSuccess(this.playlistItems);
}
class PlayListItemsFailure extends PlayListItemsState {}
