part of 'guide_items_cubit.dart';

@immutable
abstract class GuideItemsState {}

class GuideItemsInitial extends GuideItemsState {}
class GuideItemsLoading extends GuideItemsState {}
class GuideItemsSuccess extends GuideItemsState {

  List<Snippet> snippetList;
  List<ContentDetails> contentDetailsList;

  GuideItemsSuccess(this.snippetList, this.contentDetailsList);
}
class PlayListItemsFailure extends GuideItemsState {}
