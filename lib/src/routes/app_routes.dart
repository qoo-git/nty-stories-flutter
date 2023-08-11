import 'package:go_router/go_router.dart';
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
      builder: (context, state) =>
          const FeedPage(viewOption: FeedViewOptions.grid),
      routes: [
        GoRoute(
            name: AppRoutes.article.name,
            path: 'article/:title',
            builder: (context, state) {
              final title = state.pathParameters['title']!;
              return ArticlePage(title: title);
            }),
        GoRoute(
            name: AppRoutes.webview.name,
            path: 'article/:link',
            builder: (context, state) {
              final link = state.pathParameters['link']!;
              return WebViewPage(link: link);
            }),
      ],
    )
  ],
  // TODO: error builder
);
