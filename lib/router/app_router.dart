import 'package:bloc_trial/bloc/cubit/counter_cubit.dart';
import 'package:bloc_trial/screens/home_screeen.dart';
import 'package:bloc_trial/screens/second_screen.dart';
import 'package:bloc_trial/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => HomeScreen(title: 'Home Screen', colors: Colors.grey));
      // break;
      case '/second':
        return MaterialPageRoute(
            builder: (_) => SecondScreen(
                title: 'Second Screen', colors: Colors.brown));
      // break;
      case '/third':
        return MaterialPageRoute(
            builder: (_) => ThirdScreen(
                title: 'Third Screen', colors: Colors.blueGrey));
      // break;
      default:
        return null;
    }
  }
}
