import 'package:flutter/material.dart';
import 'package:nyt/src/common_widgets/responsive_center.dart';
import 'package:nyt/src/constants/app_sizes.dart';
import 'package:nyt/src/constants/breakpoints.dart';

class ResponsiveScrollableCard extends StatelessWidget {
  const ResponsiveScrollableCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveCenter(
        maxContentWidth: Breakpoint.tablet,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.p16),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
