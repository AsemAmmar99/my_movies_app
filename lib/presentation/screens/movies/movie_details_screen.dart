import 'package:flutter/material.dart';
import 'package:my_movies_app/data/remote/responses/movies/movies_response.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../styles/colors.dart';
import '../../widgets/default_cached_network_image.dart';
import '../../widgets/default_text.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key, required this.moviesModel}) : super(key: key);

  final MoviesResults moviesModel;

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
              text: moviesModel.title,
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
                          imageURL: '$imagesBaseURL${moviesModel.backdropPath}',
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
                            text: moviesModel.overview,
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