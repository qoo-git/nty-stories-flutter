import 'package:flutter/material.dart';
import 'package:nyt/src/common_widgets/responsive_center.dart';
import 'package:nyt/src/constants/app_sizes.dart';
import 'package:nyt/src/features/feed/presentation/components/feed_viewer.dart';
import 'package:nyt/src/features/feed/presentation/components/search_and_filter_bar.dart';
import 'package:nyt/src/features/feed/presentation/components/view_option_state.dart';
import 'package:nyt/src/features/feed/presentation/components/view_options.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({
    super.key,
    required this.viewOption,
    required this.section,
  });

  final FeedViewOptions viewOption;
  final String section;

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  // * A ScrollController to register a listener that dismisses the
  // * on-screenkeyboard when user scrolls.
  // * The page has a search field that will prompt an on-screen keyboard
  final _scrollController = ScrollController();

  @override
  void initState() {
    // * There is a bug  when scrolling the page
    // * It throws an assertion since there is no focused widget during scrolling
    // * The assertion is caught by the [Foundation] library.
    _scrollController.addListener(_dismissOnScreenKeyboard);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_dismissOnScreenKeyboard);
    super.dispose();
  }

// An on-screen keyboard appears on mobile platform when the search field gets focus
// This method dismisses the on-screen keyboard when the user scrolls
  void _dismissOnScreenKeyboard() {
    if (FocusScope.of(context).hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            ResponsiveSliverCenter(
              padding: const EdgeInsets.all(Sizes.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchAndFilterBar(
                    viewOption: widget.viewOption,
                  ),
                  const SizedBox(
                    height: Sizes.p8,
                  ),
                  ViewOptions(
                    viewOption: widget.viewOption,
                  ),
                ],
              ),
            ),
            ResponsiveSliverCenter(
              padding: const EdgeInsets.all(Sizes.p16),
              child: FeedViewer(
                viewOption: widget.viewOption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
