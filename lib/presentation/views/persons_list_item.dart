import'package:flutter/material.dart';
import 'package:my_movies_app/constants/screens.dart' as screens;
import 'package:sizer/sizer.dart';
import '../../constants/constants.dart';
import '../../data/remote/responses/persons/persons_response.dart';
import '../styles/colors.dart';
import '../widgets/default_cached_network_image.dart';
import '../widgets/default_text.dart';

class PersonsListItem extends StatelessWidget {
  const PersonsListItem({Key? key, required this.personModel}) : super(key: key);

  final PersonsResults personModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, screens.personDetails, arguments: personModel);
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
               text: personModel.name,
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
                  imageURL: '$imagesBaseURL${personModel.profilePath}',
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
                    text: personModel.knownForDepartment,
                    fontSize: 15.sp,
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
