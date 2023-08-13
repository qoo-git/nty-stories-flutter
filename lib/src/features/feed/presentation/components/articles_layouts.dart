import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:nyt/src/constants/app_sizes.dart';
import 'package:nyt/src/features/feed/domain/feed_model.dart';
import 'package:nyt/src/features/feed/presentation/components/feed_list_card.dart';

class FeedGridLayout extends StatelessWidget {
  const FeedGridLayout(
      {super.key, required this.itemCount, required this.itemBuilder});
  // items to be rendered on the grid
  final int itemCount;
  // Function to build a Widget for every grid item
  final Widget Function(BuildContext, int) itemBuilder;
  // * keys to use in testing throug find.byKey
  static const gridKey = Key('grid-key');

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (contest, constraint) {
        final width = constraint.maxWidth;
        // 1 column for widths < 500px
        // then add one more column for every 250px more
        final crossAxisCount = max(1, width ~/ 250);
        // once the crossAxisCount is known, calculate the column and row sizes
        // set some flexible track sizes bases on the crossAxisCount with 1.fr
        final columnSizes = List.generate(crossAxisCount, (_) => 1.fr);
        final numRows = (itemCount / crossAxisCount).ceil();
        //set all the row sizes to auto (self-sizing height)
        final rowSizes = List.generate(numRows, (_) => auto);
        // Custom layout grid
        return LayoutGrid(
          columnSizes: columnSizes,
          rowSizes: rowSizes,
          rowGap: Sizes.p24,
          columnGap: Sizes.p24,
          children: <Widget>[
            for (var i = 0; i < itemCount; i++) itemBuilder(context, i),
          ],
        );
      },
    );
  }
}

class FeedListLayout extends StatelessWidget {
  const FeedListLayout({
    super.key,
    required this.feed,
  });

  final List<Feed> feed;
  // * keys to use in testing throug find.byKey
  final gridKey = const Key('list-key');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        for (var i = 0; i < feed.length; i++) FeedListCard(feed: feed, i: i),
      ],
    );
  }
}
