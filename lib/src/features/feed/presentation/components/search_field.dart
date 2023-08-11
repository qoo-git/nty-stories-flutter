import 'package:flutter/material.dart';
import 'package:nyt/src/constants/app_sizes.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _controller,
      builder: (context, value, _) {
        return TextField(
          controller: _controller,
          autofocus: false,
          style: Theme.of(context).textTheme.bodySmall,
          decoration: InputDecoration(
            hintText: 'Search',
            icon: const Icon(
              Icons.search_rounded,
              size: Sizes.p16,
            ),
            suffix: value.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      _controller.clear();
                      //TODO: clear search state
                    },
                    icon: const Icon(
                      Icons.clear_rounded,
                      size: Sizes.p16,
                    ),
                  )
                : null,
          ),
          //TODO: implement onChanged
          onChanged: null,
        );
      },
    );
  }
}
