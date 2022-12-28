import 'package:flutter/material.dart';
import '../../constants/screens.dart' as screens;
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
      default:
        return null;
    }
  }
}