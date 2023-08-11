import 'package:flutter/material.dart';
import 'package:nyt/src/constants/app_sizes.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // TODO: gesture detectors
        IconButton(
          onPressed: () {
            //TODO: filter results
          },
          icon: Icon(
            Icons.filter_alt_rounded,
            size: Sizes.p12,
            color: Colors.grey[700],
          ),
        ),
        Text(
          'Filter',
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}
