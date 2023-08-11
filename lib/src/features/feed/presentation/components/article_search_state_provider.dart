import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyt/src/features/feed/data/fake_data_respository.dart';
import 'package:nyt/src/features/feed/domain/feed_model.dart';

final articleSearchQueryStateProvider = StateProvider<String>((ref) {
  return '';
});

final articleSearchResultProvider =
    FutureProvider.autoDispose<List<Feed>>((ref) async {
  final searchQuery = ref.watch(articleSearchQueryStateProvider);
  return ref.watch(articleListSearchProvider(searchQuery).future);
});
