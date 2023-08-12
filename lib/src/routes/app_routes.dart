import 'package:go_router/go_router.dart';
import 'package:nyt/src/constants/filter_options.dart';
import 'package:nyt/src/features/feed/presentation/article_page.dart';
import 'package:nyt/src/features/feed/presentation/components/view_option_state.dart';
import 'package:nyt/src/features/feed/presentation/feed_page.dart';
import 'package:nyt/src/features/feed/presentation/webview.dart';

enum AppRoutes {
  feed,
  article,
  webview,
}

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: AppRoutes.feed.name,
      path: '/',
      builder: (context, state) => FeedPage(
          section: filterOptions.first, viewOption: FeedViewOptions.grid),
      routes: [
        GoRoute(
          name: AppRoutes.article.name,
          path: 'article/:title',
          builder: (context, state) {
            final title = state.pathParameters['title']!;
            return ArticlePage(title: title);
          },
          routes: [
            GoRoute(
                name: AppRoutes.webview.name,
                path: 'webview',
                builder: (context, state) {
                  final title = state.pathParameters['title']!;
                  return WebViewPage(title: title);
                }),
          ],
        ),
      ],
    )
  ],
  // TODO: error builder
);
