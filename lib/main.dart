import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyt/src/app.dart';
import 'package:nyt/src/features/feed/data/fake_data_respository.dart';
import 'package:nyt/src/features/feed/data/remote_repository.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // remove the # for web urls
  setPathUrlStrategy();
  final container = ProviderContainer(overrides: [
    feedRepositoryProvider.overrideWith((ref) {
      return ref.watch(remoteFeedRepositoryProvider);
    }),
  ]);

// * Entry point of the app
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

// TODO: register error handling