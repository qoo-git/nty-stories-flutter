import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyt/src/features/feed/data/fake_data_respository.dart';
import 'package:nyt/src/features/feed/domain/feed_model.dart';
import 'package:nyt/src/features/feed/presentation/components/filter_provider.dart';

final articleSearchQueryStateProvider = StateProvider<String>((ref) {
  return '';
});

final articleSearchResultProvider =
    FutureProvider.autoDispose<List<Feed>>((ref) async {
  final searchQuery = ref.watch(articleSearchQueryStateProvider);
  final section = ref.watch(filterSectionProvider);
  return ref.watch(feedListSearchProvider(section, searchQuery).future);
});
