part of 'counter_cubit.dart';

class CounterState {
  int counterValue;
  bool? wasIncremented;
  bool isInProgress;
  CounterState({
    required this.counterValue,
    this.wasIncremented,
    this.isInProgress = false,
  });
}
