import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyt/src/constants/app_sizes.dart';
import 'package:nyt/src/features/feed/presentation/components/article_search_state_provider.dart';

class SearchTextField extends ConsumerStatefulWidget {
  const SearchTextField({super.key});

  @override
  ConsumerState<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends ConsumerState<SearchTextField> {
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
                      ref.read(articleSearchQueryStateProvider.notifier).state =
                          '';
                    },
                    icon: const Icon(
                      Icons.clear_rounded,
                      size: Sizes.p16,
                    ),
                  )
                : null,
          ),
          onChanged: (text) =>
              ref.read(articleSearchQueryStateProvider.notifier).state = text,
        );
      },
    );
  }
}
