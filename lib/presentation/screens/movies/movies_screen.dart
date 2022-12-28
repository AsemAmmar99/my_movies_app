import 'package:flutter/material.dart';
import 'package:my_movies_app/business_logic/app_cubit.dart';
import 'package:my_movies_app/presentation/views/movies_list_item.dart';
import 'package:sizer/sizer.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
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
      MoviesListItem(movieModel: cubit.moviesResponse.results[index]),
      separatorBuilder: (context, index) =>
      Row(
        children: [
          Expanded(child: Divider(height: 1.h, color: Colors.black45,))
        ],
      ),
      itemCount: cubit.moviesResponse.results.length,
    );
  }
}
