import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/logic/cubit/counter_cubit/counter_cubit.dart';
import 'package:learn_bloc/logic/cubit/interner_cubit/internet_cubit.dart';
import 'package:learn_bloc/presintation/router/app_router.dart';

void main() {
  runApp( MyApp(connectivity:Connectivity() ,));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  const MyApp({super.key,required this.connectivity});

  @override
  Widget build(BuildContext context) {
    //Create Bloc Provider
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (internetContext) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider(create: (counterCubitContext) => CounterCubit(internetCubit: InternetCubit(connectivity: connectivity) ),
        )
      ],
      child: MaterialApp(
        title: 'Counter Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }

}

