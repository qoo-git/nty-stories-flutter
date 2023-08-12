import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyt/src/features/feed/domain/feed_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

abstract class DataRepository {
  /// fetch all news articles from a given section
  Future<List<Feed>> fetchFeedArticlesList({required String section});

  ///fetch a single news article from a list of new articles in a certain section
  Future<Feed?> fetchFeedArticle(
      {required String title, required String section});

  /// fetch a news article with the requested title or author
  Future<List<Feed>> searchFeedArticle(
      {required String section, required String query});
}

final dataRepositoryProvider = Provider<DataRepository>((ref) {
  // * Override this on the main.dart file to use the remote repository in production
  throw UnimplementedError();
});
