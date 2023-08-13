import 'package:flutter_test/flutter_test.dart';

import 'feed/feed_robot.dart';

void main() {
  testWidgets('Full article flow', (WidgetTester tester) async {
    // * Note: All tests are wrapped with `runAsync` to prevent this error:
    // * A Timer is still pending even after the widget tree was disposed.
    await tester.runAsync(() async {
      final r = FeedRobot(tester);
      await r.pumpMyApp();
      r.expectGridView();
      r.expectNoListView();
      r.selectArticleFromGrid();
      r.expectsArticlePage();
    });
  });
}
