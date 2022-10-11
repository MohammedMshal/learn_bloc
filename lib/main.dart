import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Create Bloc Provider
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Counter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    //Call Bloc
    BlocProvider.of<CounterCubit>(context).increment();
  }

  void _decrementCounter() {
    //Call Bloc
    BlocProvider.of<CounterCubit>(context).decrement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
  listener: (context, state) {
    if(state.isIncrement == true){
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Incremented!'),duration: Duration(milliseconds: 300),));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Decremented!'),duration: Duration(milliseconds: 300),));
    }
  },
  child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            //Rebuild Screen with Bloc Builder
            BlocBuilder<CounterCubit, CounterState>(
              //control rebuild widget
              //buildWhen: (previous, current) {},
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'BRR, NEGATIVE ${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'YAY ${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'HMM NUMBER 5 ${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else {
                  return Text(
                    '${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
          ],
        ),
      ),
),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Row(
          children: [
            FloatingActionButton(
              key: const Key('1'),
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const Spacer(),
            FloatingActionButton(
              key: const Key('2'),
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(Icons.minimize),
            ),
          ],
        ),
      ),
    );
  }
}

/*
تستخدم البلوك فاليو عندما نريد إستعمال البلوك فى سكرين خارج نطاقة
            BlocProvider.value(
              value: BlocProvider<Name Bloc>.of(context) ,
              child: Wrap Widget here,
            )

 */