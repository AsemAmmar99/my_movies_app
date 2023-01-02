import 'package:flutter/material.dart';
import 'package:my_movies_app/data/remote/responses/movies/movies_response.dart';
import 'package:my_movies_app/data/remote/responses/persons/persons_response.dart';
import 'package:my_movies_app/presentation/screens/movies/movie_details_screen.dart';
import 'package:my_movies_app/presentation/screens/persons/person_details_screen.dart';
import 'package:my_movies_app/presentation/screens/tv_shows/tv_show_details_screen.dart';
import '../../constants/screens.dart' as screens;
import '../../data/remote/responses/tv_shows/tv_shows_response.dart';
import '../screens/home/home_layout.dart';
import '../screens/splash/splash_screen.dart';

class AppRouter{
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings){
    startScreen = const SplashScreen();

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.homeLayout:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
      case screens.movieDetails:
        final MoviesResults moviesModel = settings.arguments as MoviesResults;
        return MaterialPageRoute(builder: (_) => MovieDetailsScreen(moviesModel: moviesModel));
      case screens.tvShowDetails:
        final TVShowsResults tvShowsModel = settings.arguments as TVShowsResults;
        return MaterialPageRoute(builder: (_) => TVShowDetailsScreen(tvShowsModel: tvShowsModel));
      case screens.personDetails:
        final PersonsResults personsModel = settings.arguments as PersonsResults;
        return MaterialPageRoute(builder: (_) => PersonDetailsScreen(personsModel: personsModel));
      default:
        return null;
    }
  }
}