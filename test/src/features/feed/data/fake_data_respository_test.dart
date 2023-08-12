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
        await feedRepository.fetchFeedArticlesList('arts'),
        [kTestFeed[0], kTestFeed[1], kTestFeed[2]],
      );
    });

    test('''fetchFeedArticlesList(arts)
    returns four articles''', () async {
      final feedRepository = makeFeedRepository();
      expect(
        await feedRepository.fetchFeedArticlesList('movies'),
        [kTestFeed[3], kTestFeed[4], kTestFeed[5], kTestFeed[6]],
      );
    });

    test('''fetchFeedArticlesList(science)
    returns last three article''', () async {
      final feedRepository = makeFeedRepository();
      expect(
        await feedRepository.fetchFeedArticlesList('science'),
        [kTestFeed[7], kTestFeed[8], kTestFeed[9]],
      );
    });

    test('''watchFeedArticle(arts, Emergence of Artificial Intelligence)
    emits  first three kTestProducts''', () async {
      final feedRepository = makeFeedRepository();
      expect(
        feedRepository.watchFeedList('arts'),
        emits(kTestFeed),
      );
    });
  });
}
