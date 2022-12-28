import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movies_app/data/remote/requests/movies/movies_request.dart';
import 'package:my_movies_app/data/remote/responses/movies/movies_response.dart';
import '../presentation/screens/movies/movies_screen.dart';
import '../presentation/screens/persons/persons_screen.dart';
import '../presentation/screens/tv_shows/tv_shows_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  MoviesResponse moviesResponse = MoviesResponse();

  int currentIndex = 0;

  List<Widget> screens = [
    const MoviesScreen(),
    const TVShowsScreen(),
    const PersonsScreen(),
  ];

  List<String> appBarTitles = [
    'Movies',
    'TV Shows',
    'Persons',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  void getMovies(){

    emit(AppMoviesLoadingState());
    
    MoviesRequest().moviesRequest(apiKey: '234d4710ba5a52c971c9fa050f3b0738').then((value) {
      moviesResponse = value;
      emit(AppMoviesSuccessState());
    }).catchError((error){
      emit(AppMoviesErrorState());
    });
  }

}
