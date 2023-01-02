import 'package:flutter/material.dart';
import 'package:my_movies_app/constants/constants.dart';
import 'package:my_movies_app/data/remote/responses/tv_shows/tv_shows_response.dart';
import 'package:sizer/sizer.dart';

import '../../constants/screens.dart' as screens;
import '../styles/colors.dart';
import '../widgets/default_cached_network_image.dart';
import '../widgets/default_text.dart';

class TVShowsListItem extends StatelessWidget {
  const TVShowsListItem({Key? key, required this.tvShowModel}) : super(key: key);

  final TVShowsResults tvShowModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, screens.tvShowDetails, arguments: tvShowModel);
      },
      child: Container(
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
               text: tvShowModel.name,
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
                  imageURL: '$imagesBaseURL${tvShowModel.posterPath}',
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
                    text: tvShowModel.overview,
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
      ),
    );
  }
}
