part of 'counter_cubit.dart';


class CounterState extends Equatable {
  int counterValue;
  bool? isIncrement;

  CounterState({required this.counterValue, this.isIncrement});

  @override
  List<Object> get props => [counterValue];
}
