import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constans/constans.dart';
import '../../logic/cubit/counter_cubit/counter_cubit.dart';
import '../../logic/cubit/interner_cubit/internet_cubit.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnection &&
                      state.connectionType == ConnectionType.mobile) {
                    return const Text(
                      'Mobile',
                    );
                  }else if (state is InternetConnection &&
                      state.connectionType == ConnectionType.wifi){
                    return const Text(
                      'WIFI',
                    );
                  }else if (state is InternetConnection){
                    return Text(
                      'Disconnection',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.grey),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
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

      floatingActionButton: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: 'btn3',
                  onPressed:(){
                    //BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: 'btn4',
                  onPressed: (){
                    //BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.minimize),
                ),
                //Navigate Screen
              ],
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