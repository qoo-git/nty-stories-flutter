import 'package:flutter_test/flutter_test.dart';
import 'package:nyt/src/constants/test_feed.dart';
import 'package:nyt/src/features/feed/data/fake_data_respository.dart';

void main() {
  FakeFeedRepository makeFeedRepository() => FakeFeedRepository(
        addDelay: false,
      );
  group('FakeFeedRepository', () {
    test('getFeedList returns a global list', () {
      final feedRepository = makeFeedRepository();
      expect(
        feedRepository.getFeedList(),
        kTestFeed,
      );
    });

    test('''getArticleFeed(Emergence of Artificial Intelligence)
    returns fisrt article''', () {
      final feedRepository = makeFeedRepository();
      expect(
        feedRepository.getArticleFeed('Emergence of Artificial Intelligence'),
        kTestFeed.first,
      );
    });

    test('''getArticleFeed(The World A Global Village)
    returns second article''', () {
      final feedRepository = makeFeedRepository();
      expect(
        feedRepository.getArticleFeed('The World A Global Village'),
        kTestFeed[1],
      );
    });

    test('''fetchFeedArticlesList(arts)
    returns first 3 articles''', () async {
      final feedRepository = makeFeedRepository();
      expect(
        await feedRepository.fetchFeedArticlesList(section: 'arts'),
        [kTestFeed[0], kTestFeed[1], kTestFeed[2]],
      );
    });

    test('''fetchFeedArticlesList(arts)
    returns four articles''', () async {
      final feedRepository = makeFeedRepository();
      expect(
        await feedRepository.fetchFeedArticlesList(section: 'movies'),
        [kTestFeed[3], kTestFeed[4], kTestFeed[5], kTestFeed[6]],
      );
    });

    test('''fetchFeedArticlesList(science)
    returns last three article''', () async {
      final feedRepository = makeFeedRepository();
      expect(
        await feedRepository.fetchFeedArticlesList(section: 'science'),
        [kTestFeed[7], kTestFeed[8], kTestFeed[9]],
      );
    });

    test('''fetchFeedArticle(arts, Emergence of Artificial Intelligence)
    returns  first three kTestProducts''', () async {
      final feedRepository = makeFeedRepository();
      expect(
        await feedRepository.fetchFeedArticle(
            section: 'arts', title: 'Emergence of Artificial Intelligence'),
        kTestFeed[0],
      );
    });

    test('''fetchFeedArticle(arts, Artificial Intelligence)
    returns null ''', () async {
      final feedRepository = makeFeedRepository();
      expect(
        await feedRepository.fetchFeedArticle(
            section: 'arts', title: 'Artificial Intelligence'),
        null,
      );
    });

    test('''searchFeedArticle(arts, Emergence of Artificial Intelligence)
    return 3 kTestProducts''', () async {
      final feedRepository = makeFeedRepository();
      expect(
        await feedRepository.searchFeedArticle(
            section: 'arts', query: 'Emergence of Artificial Intelligence'),
        [kTestFeed[0]],
      );
    });

    test('''searchFeedArticle(movies, Claire Wangari)
    return 2  kTestProducts''', () async {
      final feedRepository = makeFeedRepository();
      expect(
        await feedRepository.searchFeedArticle(
            section: 'movies', query: 'Claire Wangari'),
        [kTestFeed[3], kTestFeed[5]],
      );
    });
  });
}
