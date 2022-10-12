import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_bloc/logic/cubit/counter_cubit.dart';

void main() {
  group('Counter Cubit', () {
    CounterCubit? cubit;
    setUp(() => {cubit = CounterCubit()});
    tearDown(() => {cubit!.close()});
    test('the init state ',
        () => {expectLater(cubit!.state, const CounterState(counterValue: 0))});

    blocTest('the cubit should emit a CounterState',
        build: ()=> cubit!, act: (cubit)=> cubit.increment() , expect: () =>[const CounterState(counterValue: 1,isIncrement: true)],
        );
  });

}
