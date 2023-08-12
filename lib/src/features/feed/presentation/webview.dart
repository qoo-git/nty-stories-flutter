import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyt/src/features/feed/data/fake_data_respository.dart';
import 'package:nyt/src/features/feed/presentation/components/filter_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends ConsumerStatefulWidget {
  const WebViewPage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends ConsumerState<WebViewPage> {
  var _loadingPercentage = 0;
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final section = ref.watch(filterSectionProvider);
    final article = ref.watch(feedProvider(section, widget.title));
    _controller = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              _loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              _loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              _loadingPercentage = 100;
            });
          },
        ),
      )
      ..loadRequest(
        Uri.parse(article.value!.link),
      );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Top Stories ',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(
            controller: _controller,
          ),
          if (_loadingPercentage < 100)
            Center(
              child: CircularProgressIndicator(
                value: _loadingPercentage / 100.0,
              ),
            ),
        ],
      ),
    );
  }
}
