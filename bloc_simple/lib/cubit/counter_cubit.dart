import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState(counterValue: 0));

  void increment() => emit(CounterState(counterValue: state.counterValue + 1, wasIncremented: true, isInProgress: true));
  void decrement() => emit(CounterState(counterValue: state.counterValue - 1, wasIncremented: false, isInProgress: true));
  void reset({bool? resetNumber}) => emit(CounterState(counterValue: resetNumber ?? false ? 0 : state.counterValue, isInProgress: false));
}
