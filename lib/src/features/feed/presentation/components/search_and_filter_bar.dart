import 'package:flutter/material.dart';
import 'package:nyt/src/constants/app_sizes.dart';
import 'package:nyt/src/features/feed/presentation/components/filter_button.dart';
import 'package:nyt/src/features/feed/presentation/components/search_field.dart';
import 'package:nyt/src/features/feed/presentation/components/view_option_state.dart';

class SearchAndFilterBar extends StatelessWidget {
  const SearchAndFilterBar({super.key, required this.viewOption});

  final FeedViewOptions viewOption;

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(child: SearchTextField()),
        SizedBox(width: Sizes.p8),
        FilterButton(),
      ],
    );
  }
}
