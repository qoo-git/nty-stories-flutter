import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyt/src/app.dart';
import 'package:nyt/src/exceptions/error_logger.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // log successful and unsuccessful image loads
  CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
  // remove the # for web urls
  setPathUrlStrategy();
  final container = ProviderContainer();
  final errorLogger = container.read(errorLoggerProvider);
  // * Register error handlers. For more info, see:

  registerErrorHandlers(errorLogger);
  // * Entry point of the app

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

void registerErrorHandlers(ErrorLogger errorLogger) {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    errorLogger.logError(details.exception, details.stack);
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    errorLogger.logError(error, stack);
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Center(
      child: Card(
        color: Colors.grey[200],
        child: Center(child: Text(details.toString())),
      ),
    );
  };
}
