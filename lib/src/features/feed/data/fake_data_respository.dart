import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyt/src/constants/test_feed.dart';
import 'package:nyt/src/features/feed/domain/feed_model.dart';
import 'package:nyt/src/utils/in_memory.dart';

class FakeFeedRepository {
  FakeFeedRepository({this.addDelay = true});
  final bool addDelay;

  /// pre-load device memory with the sample test data
  final _feed = InMemoryStore<List<Feed>>(List.from(kTestFeed));

  List<Feed> getFeedList() {
    return _feed.value;
  }

  Feed? getArticleFeed(String title) {
    return _getFeedArticle(_feed.value, title);
  }

  Future<List<Feed>> fetchFeedArticlesList() async {
    return Future.value(_feed.value);
  }

  Stream<List<Feed>> watchFeedList() {
    return _feed.stream;
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

  /// Search for an article using the title
  Future<List<Feed>> searchFeedArticle(String query) async {
    assert(_feed.value.length <= 100,
        'Client-side search should only be used for small amounts of data');

    // fetch all products from repository
    final feedArticleList = await fetchFeedArticlesList();
    // return any article that matches the query passed
    return feedArticleList
        .where((article) =>
            article.title.toLowerCase().contains(query) ||
            article.title.contains(query) ||
            article.title.toUpperCase().contains(query) ||
            article.author.toLowerCase().contains(query) ||
            article.author.contains(query) ||
            article.author.toUpperCase().contains(query) ||
            article.section.toLowerCase().contains(query) ||
            article.section.contains(query) ||
            article.section.toUpperCase().contains(query))
        .toList();
  }
}

// fakeFeedRepositoryProvider
final fakeFeedRepositoryProvider = Provider<FakeFeedRepository>((ref) {
  // * Set delay to false for faster loading during development
  // * Set it to true during testing to test loading states
  return FakeFeedRepository(addDelay: false);
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

final feedArticleListFutureProvider =
    FutureProvider.autoDispose<List<Feed>>((ref) {
  final feedRepository = ref.watch(fakeFeedRepositoryProvider);
  return feedRepository.fetchFeedArticlesList();
});

final articleListSearchProvider =
    FutureProvider.autoDispose.family<List<Feed>, String>((ref, query) async {
  final link = ref.keepAlive();
  Timer(const Duration(seconds: 20), () {
    link.close();
  });
  final feedRepository = ref.watch(fakeFeedRepositoryProvider);
  return feedRepository.searchFeedArticle(query);
});
