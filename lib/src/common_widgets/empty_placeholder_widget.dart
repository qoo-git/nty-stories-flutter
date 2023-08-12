import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nyt/src/constants/app_sizes.dart';
import 'package:nyt/src/routes/app_routes.dart';

class EmptyPlaceholderWidget extends StatelessWidget {
  const EmptyPlaceholderWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            gapH32,
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFf7f2f9),
                  borderRadius: BorderRadius.circular(Sizes.p12),
                ),
                child: ElevatedButton(
                  onPressed: () => context.goNamed(AppRoutes.feed.name),
                  child: Text(
                    'Go Home',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
