import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nyt/src/common_widgets/custom_image.dart';
import 'package:nyt/src/constants/app_sizes.dart';
import 'package:nyt/src/features/feed/domain/feed_model.dart';
import 'package:nyt/src/routes/app_routes.dart';

class FeedListCard extends StatelessWidget {
  const FeedListCard({
    super.key,
    required this.feed,
    required this.i,
  });

  final List<Feed> feed;
  final int i;

  // * Keys for testing using find.byKey()
  static const listArticleKey = Key('list-card');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.p8),
      margin: const EdgeInsets.symmetric(vertical: Sizes.p8),
      decoration: BoxDecoration(
        color: const Color(0xFFf7f2f9),
        borderRadius: BorderRadius.circular(Sizes.p8),
      ),
      child: GestureDetector(
        onTap: () => context.goNamed(
          AppRoutes.article.name,
          pathParameters: {'title': feed[i].title},
        ),
        child: ListTile(
          leading: SizedBox(
              width: Sizes.p64, child: CustomImage(imageUrl: feed[i].url)),
          title: Text(
            feed[i].title,
            style: Theme.of(context).textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            feed[i].author,
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
