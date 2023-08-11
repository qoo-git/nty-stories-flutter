import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    // TODO: use [CachedNetworkImage] for remote sources
    return Image.asset(imageUrl);
  }
}
