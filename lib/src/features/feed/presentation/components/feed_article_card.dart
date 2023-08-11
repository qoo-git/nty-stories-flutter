import 'package:flutter/material.dart';
import 'package:nyt/src/common_widgets/custom_image.dart';
import 'package:nyt/src/constants/app_sizes.dart';
import 'package:nyt/src/features/feed/domain/feed_model.dart';

class FeedArticleCard extends StatelessWidget {
  const FeedArticleCard({
    super.key,
    required this.feedArticle,
    this.onTap,
  });

  final Feed feedArticle;
  final VoidCallback? onTap;

  // TODO: set keys for testing

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CustomImage(imageUrl: feedArticle.thumbnail),
              gapH8,
              const Divider(),
              gapH8,
              Text(
                feedArticle.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              gapH8,
              Text(
                feedArticle.author,
                style: Theme.of(context).textTheme.bodySmall!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
