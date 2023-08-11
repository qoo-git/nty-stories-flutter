import 'package:flutter/material.dart';
import 'package:nyt/src/constants/app_sizes.dart';
import 'package:nyt/src/features/feed/presentation/components/filter_button.dart';
import 'package:nyt/src/features/feed/presentation/components/search_field.dart';
import 'package:nyt/src/features/feed/presentation/components/view_option_state.dart';
import 'package:nyt/src/features/feed/presentation/components/view_options.dart';

class SearchAndFilterBar extends StatelessWidget {
  const SearchAndFilterBar({super.key, required this.viewOption});

  final FeedViewOptions viewOption;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Expanded(child: SearchTextField()),
        const SizedBox(width: Sizes.p8),
        const FilterButton(),
        const SizedBox(width: Sizes.p20),
        ViewOptions(
          viewOption: viewOption,
        ),
      ],
    );
  }
}
