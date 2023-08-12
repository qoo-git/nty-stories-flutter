import 'package:http/http.dart' as http;
import 'package:nyt/src/features/feed/data/data_repository.dart';
import 'dart:convert';

import 'package:nyt/src/features/feed/domain/feed_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_repository.g.dart';

class RemoteRepositoryException implements Exception {
  RemoteRepositoryException(this.message);
  final String message;
}

class RemoteRepository implements DataRepository {
  static const baseUrl = 'https://api.nytimes.com/svc/topstories/v2';
  static const apiKey = 'gwK7juN9TlpaUaFGzJg0U0bjmcy3MA98';

  @override

  /// fetch all news articles from a given section
  Future<List<Feed>> fetchFeedArticlesList(String section) async {
    final url = Uri.parse('$baseUrl/$section.json?api-key=$apiKey');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw RemoteRepositoryException('Error fetching news');
    }
    final data = json.decode(response.body);
    if (data.isEmpty) {
      throw RemoteRepositoryException('News not available');
    }

    List<Feed> newsItems = [];
    for (var entry in data['results']) {
      newsItems.add(Feed.fromMap({
        'url': entry['multimedia'][0]['url'],
        'title': entry['title'],
        'author': entry['byline'],
        'description': entry['abstract'],
        'link': entry['url'],
        'section': entry['section'],
      }));
    }
    return newsItems;
  }

  Stream<List<Feed>> watchFeedList(String section) {
    final data = Stream.fromFuture(fetchFeedArticlesList(section));
    return data;
  }

  @override
  Stream<Feed?> watchFeedArticle(String title, String section) {
    return watchFeedList(section)
        .map((article) => _getFeedArticle(article, title));
  }

  static Feed? _getFeedArticle(List<Feed> feed, String title) {
    try {
      return feed.firstWhere((news) => news.title == title);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<Feed>> searchFeedArticle(String section, String query) async {
    // fetch all articles from the given section
    final feedArticleList = await fetchFeedArticlesList(section);
    // return any article that matches the query passed
    return feedArticleList
        .where((article) =>
            article.title.toLowerCase().contains(query) ||
            article.title.contains(query) ||
            article.title.toUpperCase().contains(query) ||
            article.author.toLowerCase().contains(query) ||
            article.author.contains(query) ||
            article.author.toUpperCase().contains(query))
        .toList();
  }
}

@riverpod
RemoteRepository remoteFeedRepository(RemoteFeedRepositoryRef ref) {
  return RemoteRepository();
}
