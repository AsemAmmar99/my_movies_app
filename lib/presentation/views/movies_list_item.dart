import 'package:flutter/material.dart';
import 'package:my_movies_app/constants/constants.dart';
import 'package:my_movies_app/data/remote/responses/movies/movies_response.dart';
import 'package:sizer/sizer.dart';

import '../styles/colors.dart';
import '../widgets/default_cached_network_image.dart';
import '../widgets/default_text.dart';

class MoviesListItem extends StatelessWidget {
  const MoviesListItem({Key? key, required this.movieModel}) : super(key: key);

  final MoviesResults movieModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: DefaultText(
             text: movieModel.title,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: lightRed,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: 2.h, bottom: 1.h),
              child: DefaultCachedNetworkImage(
                imageURL: '$imagesBaseURL${movieModel.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: DefaultText(
                  text: movieModel.overview,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: white,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
