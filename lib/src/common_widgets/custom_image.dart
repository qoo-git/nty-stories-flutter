import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.imageUrl,
    this.remoteFeed = true,
  });

  final String imageUrl;
  final bool remoteFeed;

  @override
  Widget build(BuildContext context) {
    return remoteFeed
        ? CachedNetworkImage(
            imageUrl: imageUrl,
          )
        : Image.asset(imageUrl);
  }
}
