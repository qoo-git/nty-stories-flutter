import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyt/src/app.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // remove the # for web urls
  setPathUrlStrategy();
  // * Entry point of the app
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// TODO: register error handling