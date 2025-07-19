import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

final netWorkUriReg = RegExp('^http');
final localUriReg = RegExp('^static');

class CommonImage extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const CommonImage(this.src, {Key? key, this.width, this.height, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (netWorkUriReg.hasMatch(src)) {
      return CachedNetworkImage(
        imageUrl: src,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
    }
    if (localUriReg.hasMatch(src)) {
      return Image.asset(src, width: width, height: height, fit: fit);
    }
    assert(false, '图片地址src不合法!');
    return Container();
  }
}
