import 'package:bloc_simple/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit? counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit?.close();
    });

    test('The initial state for the CounterCubit is CounterState(counterValue:0)', () {
      expect(counterCubit?.state, const CounterState(counterValue: 0));
    });

    blocTest<CounterCubit, CounterState>(
      'the cubit should emit a CounterState(CounterValue:1,wasIncremented:true,isLoading:true) when cubit.increment() function is called',
      build: () => counterCubit!,
      act: (cubit) => cubit.increment(),
      expect: () {
        return [const CounterState(counterValue: 1, wasIncremented: true, isInProgress: true)];
      },
    );

    blocTest<CounterCubit, CounterState>(
      'the cubit should emit a CounterState(CounterValue:-1,wasIncremented:false,isLoading:true) when cubit.decrement() function is called',
      build: () => counterCubit!,
      act: (cubit) => cubit.decrement(),
      expect: () {
        return [const CounterState(counterValue: -1, wasIncremented: false, isInProgress: true)];
      },
    );
  });
}
