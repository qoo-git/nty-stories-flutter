import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nyt/src/common_widgets/async_value_widget.dart';
import 'package:nyt/src/common_widgets/custom_image.dart';
import 'package:nyt/src/common_widgets/empty_placeholder_widget.dart';
import 'package:nyt/src/common_widgets/responsive_center.dart';
import 'package:nyt/src/common_widgets/responsive_multi_column_layout.dart';
import 'package:nyt/src/constants/app_sizes.dart';
import 'package:nyt/src/features/feed/data/fake_data_respository.dart';
import 'package:nyt/src/features/feed/domain/feed_model.dart';
import 'package:nyt/src/features/feed/presentation/components/filter_provider.dart';
import 'package:nyt/src/routes/app_routes.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFFf7f2f9),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final section = ref.watch(filterSectionProvider);
          final articleValue = ref.watch(feedProvider(section, title));
          return AsyncValueWidget(
            value: articleValue,
            data: (article) => article == null
                ? const EmptyPlaceholderWidget(message: 'Article not found')
                : CustomScrollView(
                    slivers: <Widget>[
                      ResponsiveSliverCenter(
                        padding: const EdgeInsets.all(Sizes.p16),
                        child: ArticleDetails(
                          article: article,
                        ),
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }
}

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key, required this.article});

  final Feed article;
  // * keys to use in testing throug find.byKey
  static const articleKey = Key('article-key');

  @override
  Widget build(BuildContext context) {
    return ResponsiveMultiColumnLayout(
      startContent: Card(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: CustomImage(imageUrl: article.url),
        ),
      ),
      spacing: Sizes.p16,
      endContent: Card(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(article.title,
                  style: Theme.of(context).textTheme.titleLarge),
              gapH8,
              Text(article.description),
              gapH8,
              const Divider(),
              gapH8,
              Text(article.author,
                  style: Theme.of(context).textTheme.bodySmall),
              gapH8,
              Center(
                child: Container(
                  color: const Color(0xFFf7f2f9),
                  child: ElevatedButton(
                      onPressed: () => context.goNamed(
                            AppRoutes.webview.name,
                            pathParameters: {'title': article.title},
                          ),
                      child: Text(
                        'See more',
                        style: Theme.of(context).textTheme.bodySmall,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
