part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counterValue;
  final bool? wasIncremented;
  final bool isInProgress;
  const CounterState({
    required this.counterValue,
    this.wasIncremented,
    this.isInProgress = false,
  });

  @override
  List<Object?> get props => [counterValue, wasIncremented, isInProgress];
}
