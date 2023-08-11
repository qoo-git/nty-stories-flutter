import 'package:flutter/material.dart';
import 'package:nyt/src/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      // allow the router to restore its state
      restorationScopeId: 'app',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
