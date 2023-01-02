import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/app_cubit.dart';
import '../../views/tv_shows_list_item.dart';

class TVShowsScreen extends StatefulWidget {
  const TVShowsScreen({Key? key}) : super(key: key);

  @override
  State<TVShowsScreen> createState() => _TVShowsScreenState();
}

class _TVShowsScreenState extends State<TVShowsScreen> {
  late AppCubit cubit;

  @override
  void initState() {
    cubit = AppCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          TVShowsListItem(tvShowModel: cubit.tvShowsResponse.results[index]),
      separatorBuilder: (context, index) =>
          Row(
            children: [
              Expanded(child: Divider(height: 1.h, color: Colors.black45,))
            ],
          ),
      itemCount: cubit.tvShowsResponse.results.length,
    );
  }
}
