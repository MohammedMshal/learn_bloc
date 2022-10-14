import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_bloc/constans/constans.dart';
import '../interner_cubit/internet_cubit.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetCubitStreamSubscription;
  CounterCubit({
    required this.internetCubit
}) : super(const CounterState(counterValue: 0)){
    internetCubitStreamSubscription = internetCubit.stream.listen((internetState) {
      if(internetState is InternetConnection && internetState.connectionType ==  ConnectionType.wifi){
        increment();
      }else if(internetState is InternetConnection && internetState.connectionType ==  ConnectionType.mobile){
        decrement();
      }
    });
  }
  void increment() => emit(CounterState(counterValue: state.counterValue + 1,isIncrement: true));
  void decrement() => emit(CounterState(counterValue: state.counterValue - 1,isIncrement: false));
  @override
  Future<void> close() {
    internetCubitStreamSubscription.cancel();
    return super.close();
  }
}
