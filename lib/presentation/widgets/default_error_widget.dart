import 'package:flutter/material.dart';
import 'package:my_movies_app/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class DefaultErrorWidget extends StatelessWidget {
  const DefaultErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Icon(Icons.error_outline, color: red, size: 50.sp,),);
  }
}
