import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../data/remote/responses/persons/persons_response.dart';
import '../../styles/colors.dart';
import '../../widgets/default_cached_network_image.dart';
import '../../widgets/default_text.dart';

class PersonDetailsScreen extends StatelessWidget {
  const PersonDetailsScreen({Key? key, required this.personsModel}) : super(key: key);

  final PersonsResults personsModel;

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
            text: personsModel.name,
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
                      imageURL: '$imagesBaseURL${personsModel.profilePath}',
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
                        text: personsModel.knownForDepartment,
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
