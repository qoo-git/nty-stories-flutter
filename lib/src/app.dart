import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // allow the router to restore its state
      restorationScopeId: 'app',
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
