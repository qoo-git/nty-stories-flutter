import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nyt/src/app.dart';
import 'package:nyt/src/features/feed/data/fake_data_respository.dart';
import 'package:nyt/src/features/feed/presentation/article_page.dart';
import 'package:nyt/src/features/feed/presentation/components/feed_article_card.dart';
import 'package:nyt/src/features/feed/presentation/components/feed_list_card.dart';

class FeedRobot {
  FeedRobot(this.tester);
  final WidgetTester tester;

  Future<void> pumpMyApp() async {
    final feedRepository = FakeFeedRepository(addDelay: false);
    final container = ProviderContainer(overrides: [
      feedRepositoryProvider.overrideWithValue(feedRepository),
    ]);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MyApp(),
      ),
    );
    await tester.pumpAndSettle();
  }

  void expectGridView() {
    final finder = find.byKey(FeedArticleCard.gridArticleKey);
    expect(finder, findsWidgets);
  }

  void expectListView() {
    final finder = find.byKey(FeedListCard.listArticleKey);
    expect(finder, findsWidgets);
  }

  void expectNoGridView() {
    final finder = find.byKey(FeedArticleCard.gridArticleKey);
    expect(finder, findsNothing);
  }

  void expectNoListView() {
    final finder = find.byKey(FeedListCard.listArticleKey);
    expect(finder, findsNothing);
  }

  Future<void> selectArticleFromGrid({int atIndex = 0}) async {
    final finder = find.byKey(FeedArticleCard.gridArticleKey);
    await tester.tap(finder.at(atIndex));
    await tester.pumpAndSettle();
  }

  Future<void> selectArticleFromList({int atIndex = 0}) async {
    final finder = find.byKey(FeedListCard.listArticleKey);
    await tester.tap(finder.at(atIndex));
    await tester.pumpAndSettle();
  }

  void expectsArticlePage() {
    final finder = find.byKey(ArticleDetails.articleKey);
    expect(finder, findsWidgets);
  }

  void expectFindArtsArticleCardsOnGrid() {
    final finder = find.byType(FeedArticleCard);
    expect(finder, findsNWidgets(3));
  }

  void expectFindMoviesArticleCardsOnGrid() {
    final finder = find.byType(FeedArticleCard);
    expect(finder, findsNWidgets(4));
  }

  void expectFindScienceArticleCardsOnGrid() {
    final finder = find.byType(FeedArticleCard);
    expect(finder, findsNWidgets(3));
  }
}
