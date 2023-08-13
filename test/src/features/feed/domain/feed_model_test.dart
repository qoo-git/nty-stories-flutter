import 'package:flutter_test/flutter_test.dart';
import 'package:nyt/src/features/feed/domain/feed_model.dart';

void main() {
  Feed makeFeedModel() => const Feed(
        url: 'assets/images/artificial-intelligence.jpeg',
        title: 'Emergence of Artificial Intelligence',
        author: 'Dennis Kinuthia',
        description:
            'Special counsel status essentially formalizes a degree of independence the prosecutor already had.',
        link:
            'https://www.nytimes.com/2023/08/11/us/weiss-special-counsel-hunter-biden.html',
        section: 'arts',
      );
  Map<String, dynamic> myMap = {
    'url': 'assets/images/touch-screens.jpeg',
    'title': 'Proliferation of 5G',
    'author': 'Claire Wangari',
    'description':
        'Special counsel status essentially formalizes a degree of independence the prosecutor already had.',
    'link':
        'https://www.nytimes.com/2023/08/11/us/weiss-special-counsel-hunter-biden.html',
    'section': 'movies',
  };

  group('Feed Model class', () {
    test('toMap() return a Map<String, dynamic>', () {
      final feedModel = makeFeedModel();
      expect(
        feedModel.toMap(),
        {
          'url': 'assets/images/artificial-intelligence.jpeg',
          'title': 'Emergence of Artificial Intelligence',
          'author': 'Dennis Kinuthia',
          'description':
              'Special counsel status essentially formalizes a degree of independence the prosecutor already had.',
          'link':
              'https://www.nytimes.com/2023/08/11/us/weiss-special-counsel-hunter-biden.html',
          'section': 'arts',
        },
      );
    });

    test('''Feed.fromMap({
      url: 'assets/images/touch-screens.jpeg',
    title: 'Proliferation of 5G',
    author: 'Claire Wangari',
    description:
        'Special counsel status essentially formalizes a degree of independence the prosecutor already had.',
    link:
        'https://www.nytimes.com/2023/08/11/us/weiss-special-counsel-hunter-biden.html',
    section: 'movies',
    }) returns a Model class populated with data''', () {
      expect(
        Feed.fromMap(myMap),
        const Feed(
            url: 'assets/images/touch-screens.jpeg',
            title: 'Proliferation of 5G',
            author: 'Claire Wangari',
            description:
                'Special counsel status essentially formalizes a degree of independence the prosecutor already had.',
            link:
                'https://www.nytimes.com/2023/08/11/us/weiss-special-counsel-hunter-biden.html',
            section: 'movies'),
      );
    });
  });
}
