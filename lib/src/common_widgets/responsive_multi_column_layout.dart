import 'package:flutter/material.dart';
import 'package:nyt/src/constants/breakpoints.dart';

/// A responsive layout that shows two children widgets side by side if there is
/// enough space, or vertically stacked if there is not enough space
class ResponsiveMultiColumnLayout extends StatelessWidget {
  const ResponsiveMultiColumnLayout({
    super.key,
    this.breakpoint = Breakpoint.tablet,
    required this.startContent,
    this.startFlex = 1,
    required this.endContent,
    this.endFlex = 1,
    required this.spacing,
  });

  final double breakpoint;
  final Widget startContent;
  final int startFlex;
  final Widget endContent;
  final int endFlex;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= breakpoint) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(flex: startFlex, child: startContent),
              SizedBox(
                width: spacing,
              ),
              Flexible(flex: endFlex, child: endContent),
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              startContent,
              SizedBox(height: spacing),
              endContent,
            ],
          );
        }
      },
    );
  }
}
