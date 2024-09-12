import 'dart:io' show Platform;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformedImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;

  const PlatformedImage({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || Platform.isFuchsia || Platform.isLinux || Platform.isWindows) {
      return Image.network(
        imageUrl,
        width: width,
        height: height,
      );
    } else {
      return CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
      );
    }
  }
}
