import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyt/src/constants/test_feed.dart';
import 'package:nyt/src/features/feed/domain/feed_model.dart';
import 'package:nyt/src/utils/delay.dart';

class FakeFeedRepository {
  FakeFeedRepository({this.addDelay = true});
  final bool addDelay;
  final List<Feed> _feed = kTestFeed;

  Stream<List<Feed>> watchFeedList() async* {
    await delay(addDelay);
    yield _feed;
  }

  Stream<Feed?> watchFeedArticle(String title) {
    return watchFeedList().map((article) => _getFeedArticle(article, title));
  }

  static Feed? _getFeedArticle(List<Feed> feed, String title) {
    try {
      return feed.firstWhere((news) => news.title == title);
    } catch (_) {
      return null;
    }
  }
}

// fakeFeedRepositoryProvider
final fakeFeedRepositoryProvider = Provider<FakeFeedRepository>((ref) {
  return FakeFeedRepository();
});

// fakeFeedListStreamProvider
final fakeFeedListStreamProvider =
    StreamProvider.autoDispose<List<Feed>>((ref) {
  debugPrint('created the fakeFeedListStreamProvider');
  //keep the listener alive for 10 seconds
  final link = ref.keepAlive();
  Timer(
    const Duration(seconds: 10),
    () => link.close(),
  );
  // show message when the listener is disposed
  ref.onDispose(() {
    debugPrint('Closed fakeFeedListProvider');
  });
  // watch the stream of incoming news feed list
  final feedRespository = ref.watch(fakeFeedRepositoryProvider);
  return feedRespository.watchFeedList();
});

// fakeFeedArticleProvider
final fakeFeedArticleProvider =
    StreamProvider.family.autoDispose<Feed?, String>((ref, title) {
  debugPrint('created the articleFeedProvider with title - $title');
  final link = ref.keepAlive();
  Timer(
    const Duration(seconds: 10),
    () => link.close(),
  );
  // show message when the listener is disposed
  ref.onDispose(() {
    debugPrint('Closed fakeFeedListProvider');
  });
// watch the stream of incoming news feed single article
  final feedRepository = ref.watch(fakeFeedRepositoryProvider);
  return feedRepository.watchFeedArticle(title);
});
