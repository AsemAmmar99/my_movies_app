import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies_app/presentation/widgets/default_error_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/app_cubit.dart';
import '../../styles/colors.dart';
import '../../widgets/default_text.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late AppCubit cubit;

  @override
  void initState() {
    cubit = AppCubit.get(context);
    cubit.getMovies();
    cubit.getTVShows();
    cubit.getPersons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return TweenAnimationBuilder(
          tween: ColorTween(begin: black, end: lightBrown),
          duration: const Duration(milliseconds: 4000),
          builder: (BuildContext context, Color? value, Widget? child) =>
              Scaffold(
                extendBody: true,
                appBar: AppBar(
                  backgroundColor: value,
                  centerTitle: true,
                  elevation: 8,
                  title: DefaultText(
                    text: cubit.appBarTitles[cubit.currentIndex],
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 22.sp,
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
                    BlocBuilder<AppCubit, AppState>(
                        builder: (context, state) {
                          if( state is AppMoviesLoadingState ||
                              state is AppTVShowsLoadingState ||
                              state is AppPersonsLoadingState){
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  CircularProgressIndicator(color: white,),
                                ],
                              ),
                            );
                          }else if(
                              state is AppMoviesSuccessState ||
                              state is AppTVShowsSuccessState ||
                              state is AppPersonsSuccessState ||
                              state is AppChangeBottomNavBarState){
                            return cubit.screens[cubit.currentIndex];
                          }else {
                            return const DefaultErrorWidget();
                          }
                        }
                    ),
                  ],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.shifting,
                  selectedItemColor: white,
                  unselectedItemColor: black,
                  currentIndex: cubit.currentIndex,
                  onTap: (index) => cubit.changeIndex(index),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.movie_filter_sharp,),
                      label: 'Movies',
                      backgroundColor: lightBrown
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.tv,),
                      label: 'TV Shows',
                      backgroundColor: red
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.star,),
                      label: 'Persons',
                      backgroundColor: lightRed
                    ),
                  ],
                ),
              ),
        );
      },
    );
  }
}