import 'package:flutter_test/flutter_test.dart';
import 'package:nyt/src/features/feed/presentation/components/feed_article_card.dart';
import 'package:nyt/src/features/feed/presentation/components/feed_list_card.dart';

class FeedRobot {
  FeedRobot(this.tester);
  final WidgetTester tester;

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
