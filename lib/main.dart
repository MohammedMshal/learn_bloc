import 'package:flutter/material.dart';
import 'package:learn_bloc/logic/cubit/counter_cubit.dart';
import 'package:learn_bloc/presintation/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
final CounterCubit counterCubit = CounterCubit();


class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Create Bloc Provider
    return  MaterialApp(
      title:'Counter Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
  @override
  void dispose() {
    counterCubit.close();
    super.dispose();
  }
}

