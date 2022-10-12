import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/logic/cubit/counter_cubit.dart';
import 'package:learn_bloc/presintation/screens/home_screen.dart';
import 'package:learn_bloc/presintation/screens/second_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String secondRoute = '/second';
  static const String thirdRoute = '/third';
}

final CounterCubit counterCubit = CounterCubit();

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider.value(
                  value: counterCubit,
                  child: const HomeScreen(
                      title: 'Home Screen', color: Colors.blue),
                )));
      case Routes.secondRoute:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider.value(
                  value: counterCubit,
                  child: const SecondScreen(
                      title: 'Second Screen', color: Colors.redAccent),
                )));
      case Routes.thirdRoute:
        return MaterialPageRoute(
            builder: ((context) => BlocProvider.value(
                  value: counterCubit,
                  child: const HomeScreen(
                      title: 'third Screen', color: Colors.greenAccent),
                )));
    }

    return undefinedRoute();
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text('No Route'),
              ),
            )));
  }
}
