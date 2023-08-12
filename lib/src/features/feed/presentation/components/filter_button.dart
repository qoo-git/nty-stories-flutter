import 'package:flutter/material.dart';
import 'package:nyt/src/constants/app_sizes.dart';
import 'package:nyt/src/constants/filter_options.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({super.key});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  var _dropdownValue = filterOptions.first;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.filter_alt_rounded,
          size: Sizes.p16,
          color: Colors.grey[700],
        ),
        const SizedBox(
          width: Sizes.p4,
        ),
        DropdownButton<String>(
          value: _dropdownValue,
          elevation: 0,
          style: Theme.of(context).textTheme.bodySmall,
          items: filterOptions.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              _dropdownValue = value!;
            });
          },
        ),
      ],
    );
  }
}
