import 'package:go_router/go_router.dart';
import 'package:nyt/src/features/feed/presentation/components/view_option_state.dart';
import 'package:nyt/src/features/feed/presentation/feed.dart';

enum AppRoutes {
  feed,
  article,
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
      // routes: [
      //   GoRoute(name: AppRoutes.article.name, path: 'article'),
      // ],
    )
  ],
  // TODO: error builder
);
