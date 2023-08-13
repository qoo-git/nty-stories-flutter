import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyt/src/constants/app_sizes.dart';
import 'package:nyt/src/features/feed/presentation/components/view_option_state.dart';
import 'package:nyt/src/features/feed/presentation/components/view_option_state_controller.dart';

class ViewOptions extends ConsumerWidget {
  const ViewOptions({super.key, required this.viewOption});

  final FeedViewOptions viewOption;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          onPressed: () {
            ref
                .read(viewOptionStateControllerProvider(viewOption).notifier)
                .updateViewOption(FeedViewOptions.list);
          },
          icon: Icon(
            Icons.list,
            size: Sizes.p20,
            color: Colors.grey[700],
          ),
        ),
        IconButton(
          onPressed: () {
            ref
                .read(viewOptionStateControllerProvider(viewOption).notifier)
                .updateViewOption(FeedViewOptions.grid);
          },
          icon: Icon(
            Icons.grid_view_rounded,
            size: Sizes.p16,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
