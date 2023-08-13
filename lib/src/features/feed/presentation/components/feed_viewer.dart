import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nyt/src/common_widgets/async_value_widget.dart';
import 'package:nyt/src/features/feed/domain/feed_model.dart';
import 'package:nyt/src/features/feed/presentation/components/article_search_state_provider.dart';
import 'package:nyt/src/features/feed/presentation/components/articles_layouts.dart';
import 'package:nyt/src/features/feed/presentation/components/feed_article_card.dart';
import 'package:nyt/src/features/feed/presentation/components/view_option_state.dart';
import 'package:nyt/src/features/feed/presentation/components/view_option_state_controller.dart';
import 'package:nyt/src/routes/app_routes.dart';

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
    final feedListValue = ref.watch(articleSearchResultProvider);
    final viewOptionState =
        ref.watch(viewOptionStateControllerProvider(widget.viewOption));
    return AsyncValueWidget<List<Feed>>(
      value: feedListValue,
      data: (feed) => feed.isEmpty
          ? Center(
              child: Text(
                'No news articles available',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          : viewOptionState.viewOption == FeedViewOptions.grid
              ? FeedGridLayout(
                  itemCount: feed.length,
                  itemBuilder: (_, index) {
                    final feedArticle = feed[index];
                    // * MouseRehion and its cursor property are used to set
                    // * the cursor to a pointer on web platform
                    // * It has no effect on mobile
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        child: FeedArticleCard(
                          feedArticle: feedArticle,
                          onTap: () => context.goNamed(
                            AppRoutes.article.name,
                            pathParameters: {'title': feedArticle.title},
                          ),
                        ),
                      ),
                    );
                  },
                )
              : FeedListLayout(feed: feed),
    );
  }
}
