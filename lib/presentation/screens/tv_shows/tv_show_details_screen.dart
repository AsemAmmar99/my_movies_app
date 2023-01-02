import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../data/remote/responses/tv_shows/tv_shows_response.dart';
import '../../styles/colors.dart';
import '../../widgets/default_cached_network_image.dart';
import '../../widgets/default_text.dart';

class TVShowDetailsScreen extends StatelessWidget {
  const TVShowDetailsScreen({Key? key, required this.tvShowsModel}) : super(key: key);

  final TVShowsResults tvShowsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBrown,
        centerTitle: true,
        elevation: 8,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: DefaultText(
            text: tvShowsModel.name,
            color: white,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            maxLines: 2,
            fontSize: 18.sp,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  black,
                  darkRed,
                  black,
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(top: 2.h, bottom: 1.h),
                    child: DefaultCachedNetworkImage(
                      imageURL: '$imagesBaseURL${tvShowsModel.backdropPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: DefaultText(
                        text: tvShowsModel.overview,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: white,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
