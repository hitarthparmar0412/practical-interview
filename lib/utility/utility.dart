import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Utility {
  static Widget imageLoader(
      {required String url,
      required String placeholder,
      required BoxFit fit,
      required BuildContext context,
      BorderRadius? borderRadius,
      BoxShape? shape}) {
    if (url.trim() == '') {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(placeholder),
          ),
          shape: shape ?? BoxShape.circle,
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.circle,
          borderRadius: borderRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      errorWidget: (context, error, dynamic a) => Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          image: DecorationImage(image: AssetImage(placeholder)),
          shape: shape ?? BoxShape.circle,
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
    );
  }
}
