import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_movies_app/presentation/widgets/default_svg.dart';
import 'package:sizer/sizer.dart';

class DefaultCachedNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String imageURL;
  final BoxFit? fit;

  const DefaultCachedNetworkImage({
    Key? key,
    this.height,
    this.width,
    required this.imageURL,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: imageURL != '',
        replacement: Padding(
          padding: EdgeInsets.all(14.sp),
          child: const DefaultSVG(imagePath: 'assets/icons/default_photo.svg'),
        ),
        child: CachedNetworkImage(
          imageUrl: imageURL,
          width: width,
          height: height,
          fit: fit,
          progressIndicatorBuilder: (context, url, progress) =>
          CircularProgressIndicator(
            value: progress.downloaded.toDouble(),
          ),
          errorWidget: (context, url, error) =>
          Padding(
              padding: EdgeInsets.all(14.sp),
              child: const DefaultSVG(imagePath: 'assets/icons/default_photo.svg'),
          ),
        ),
    );
  }
}
