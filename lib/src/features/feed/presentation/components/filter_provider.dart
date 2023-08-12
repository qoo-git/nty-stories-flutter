import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyt/src/constants/filter_options.dart';
import 'package:nyt/src/features/feed/data/fake_data_respository.dart';

import '../../domain/feed_model.dart';

final filterSectionProvider = StateProvider<String>((ref) {
  return filterOptions.first;
});

final filterSectionResultProvider =
    FutureProvider.autoDispose<List<Feed>>((ref) async {
  final filterQuery = ref.watch(filterSectionProvider);
  return ref.watch(feedListFutureProvider(filterQuery).future);
});
