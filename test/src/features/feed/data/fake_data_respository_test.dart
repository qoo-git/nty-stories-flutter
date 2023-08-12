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
  });
}
