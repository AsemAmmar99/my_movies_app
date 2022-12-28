part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppChangeBottomNavBarState extends AppState {}

class AppMoviesSuccessState extends AppState {}

class AppMoviesLoadingState extends AppState {}

class AppMoviesErrorState extends AppState {}

class AppTVShowsSuccessState extends AppState {}

class AppTVShowsLoadingState extends AppState {}

class AppTVShowsErrorState extends AppState {}

class AppPersonsSuccessState extends AppState {}

class AppPersonsLoadingState extends AppState {}

class AppPersonsErrorState extends AppState {}