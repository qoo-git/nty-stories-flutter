import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyt/src/common_widgets/async_value_widget.dart';
import 'package:nyt/src/common_widgets/custom_image.dart';
import 'package:nyt/src/constants/app_sizes.dart';
import 'package:nyt/src/features/feed/data/fake_data_respository.dart';
import 'package:nyt/src/features/feed/domain/feed_model.dart';
import 'package:nyt/src/features/feed/presentation/components/feed_article_card.dart';
import 'package:nyt/src/features/feed/presentation/components/view_option_state.dart';
import 'package:nyt/src/features/feed/presentation/components/view_option_state_controller.dart';

class FeedViewer extends ConsumerStatefulWidget {
  const FeedViewer({super.key, this.onShowListView, required this.viewOption});

  final Function(FeedViewOptions viewOption)? onShowListView;

  // The default view option to  show [GridLayout]
  final FeedViewOptions viewOption;

  @override
  ConsumerState<FeedViewer> createState() => _FeedViewerState();
}

class _FeedViewerState extends ConsumerState<FeedViewer> {
  @override
  Widget build(BuildContext context) {
    // TODO: Listen for errors on fetching news feed data
    final feedListValue = ref.watch(fakeFeedListStreamProvider);
    final viewOptionState =
        ref.watch(viewOptionStateControllerProvider(widget.viewOption));
    return AsyncValueWidget<List<Feed>>(
      value: feedListValue,
      data: (feed) => feed.isEmpty
          ? Center(
              child: Text(
                'No news available at the moment',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          : viewOptionState.viewOption == FeedViewOptions.grid
              ? FeedGridLayout(
                  itemCount: feed.length,
                  itemBuilder: (_, index) {
                    final feedArticle = feed[index];
                    // TODO: navigate to article details screen
                    return FeedArticleCard(feedArticle: feedArticle);
                  },
                )
              : FeedListLayout(
                  feed: feed,
                  itemCount: feed.length,
                ),
    );
  }
}

class FeedGridLayout extends StatelessWidget {
  const FeedGridLayout(
      {super.key, required this.itemCount, required this.itemBuilder});
  // items to be rendered on the grid
  final int itemCount;
  // Function to build a Widget for every grid item
  final Widget Function(BuildContext, int) itemBuilder;

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
    required this.itemCount,
  });

  final List<Feed> feed;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        for (var i = 0; i < itemCount; i++)
          Container(
            padding: const EdgeInsets.all(Sizes.p8),
            margin: const EdgeInsets.symmetric(vertical: Sizes.p8),
            decoration: BoxDecoration(
              color: const Color(0xFFf7f2f9),
              borderRadius: BorderRadius.circular(Sizes.p8),
            ),
            child: ListTile(
              leading: CustomImage(imageUrl: feed[i].thumbnail),
              title: Text(
                feed[i].title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                feed[i].author,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
      ],
    );
  }
}