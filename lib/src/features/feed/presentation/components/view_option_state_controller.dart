import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyt/src/features/feed/data/fake_data_respository.dart';
import 'package:nyt/src/features/feed/presentation/components/view_option_state.dart';

class ViewOptionStateController extends StateNotifier<ViewOptionState> {
  ViewOptionStateController({
    required FeedViewOptions viewOption,
    required this.feedRepository,
  }) : super(ViewOptionState(viewOption: viewOption));

  final FakeFeedRepository feedRepository;

  void updateViewOption(FeedViewOptions viewOption) {
    state = state.copyWith(viewOption: viewOption);
  }
}

final viewOptionStateControllerProvider = StateNotifierProvider.autoDispose
    .family<ViewOptionStateController, ViewOptionState, FeedViewOptions>(
        (ref, viewOption) {
  final feedRepository = ref.watch(fakeFeedRepositoryProvider);
  return ViewOptionStateController(
      viewOption: viewOption, feedRepository: feedRepository);
});
