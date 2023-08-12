import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyt/src/features/feed/domain/feed_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

abstract class DataRepository {
  /// fetch all news articles from a given section
  Future<List<Feed>> fetchFeedArticlesList(String section);

  ///fetch a single news article from a list of new articles in a certain section
  Stream<Feed?> watchFeedArticle(String title, String section);

  /// fetch a news article with the requested title or author
  Future<List<Feed>> searchFeedArticle(String section, String query);
}

final remoteFeedRepositoryProvider = Provider<DataRepository>((ref) {
  // * Override this on the main.dart file to use the remote repository in production
  throw UnimplementedError();
});
