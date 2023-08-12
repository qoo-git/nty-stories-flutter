import 'package:http/http.dart' as http;
import 'package:nyt/src/exceptions/app_exceptions.dart';
import 'package:nyt/src/features/feed/data/data_repository.dart';
import 'dart:convert';

import 'package:nyt/src/features/feed/domain/feed_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_repository.g.dart';

class RemoteRepository implements DataRepository {
  static const baseUrl = 'https://api.nytimes.com/svc/topstories/v2';
  static const apiKey = 'gwK7juN9TlpaUaFGzJg0U0bjmcy3MA98';

  @override

  /// fetch all news articles from a given section
  Future<List<Feed>> fetchFeedArticlesList({required String section}) async {
    final url = Uri.parse('$baseUrl/$section.json?api-key=$apiKey');
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw RemoteRepositoryException();
    }
    final data = json.decode(response.body);
    if (data.isEmpty) {
      throw RemoteRepositoryException();
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

  @override
  Future<List<Feed>> searchFeedArticle(
      {required String section, required String query}) async {
    // fetch all articles from the given section
    final feedArticleList = await fetchFeedArticlesList(section: section);
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
