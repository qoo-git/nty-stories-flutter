import 'dart:async';

import 'package:nyt/src/constants/test_feed.dart';
import 'package:nyt/src/features/feed/data/data_repository.dart';
import 'package:nyt/src/features/feed/data/remote_repository.dart';
import 'package:nyt/src/features/feed/domain/feed_model.dart';
import 'package:nyt/src/utils/in_memory.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fake_data_respository.g.dart';

class FakeFeedRepository implements DataRepository {
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

  @override

  /// Fetch all the articles that belong to a given section
  Future<List<Feed>> fetchFeedArticlesList({required String section}) async {
    return Future.value(
        _feed.value.where((article) => article.section == section).toList());
  }

  static Feed? _getFeedArticle(List<Feed> feed, String title) {
    try {
      return feed.firstWhere((news) => news.title == title);
    } catch (_) {
      return null;
    }
  }

  @override

  /// Search for an article using the title
  Future<List<Feed>> searchFeedArticle(
      {required String section, required String query}) async {
    assert(_feed.value.length <= 100,
        'Client-side search should only be used for small amounts of data');

    // fetch all products from repository
    final feedArticleList = await fetchFeedArticlesList(section: section);
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

  @override
  Future<Feed?> fetchFeedArticle(
      {required String title, required String section}) async {
    final data = await fetchFeedArticlesList(section: section);
    for (var article in data) {
      if (article.title == title && article.section == section) {
        return article;
      }
    }
    return null;
  }
}

@riverpod
FakeFeedRepository feedRepository(FeedRepositoryRef ref) {
  // * Set delay to false for faster loading during development
  // * Set it to true during testing to test loading states
  return FakeFeedRepository(addDelay: false);
}

@riverpod
Future<Feed?> feed(FeedRef ref, String section, String title) {
  final feedRepository = ref.watch(remoteFeedRepositoryProvider);
  return feedRepository.fetchFeedArticle(section: section, title: title);
}

@riverpod
Future<List<Feed>> feedListFuture(FeedListFutureRef ref, String section) {
  final feedRepository = ref.watch(remoteFeedRepositoryProvider);
  return feedRepository.fetchFeedArticlesList(section: section);
}

@riverpod
Future<List<Feed>> feedListSearch(
  FeedListSearchRef ref,
  String section,
  String query,
) async {
  final link = ref.keepAlive();
  final timer = Timer(const Duration(seconds: 20), () {
    link.close();
  });
  ref.onDispose(() => timer.cancel());
  final feedRepository = ref.watch(remoteFeedRepositoryProvider);
  return feedRepository.searchFeedArticle(section: section, query: query);
}
