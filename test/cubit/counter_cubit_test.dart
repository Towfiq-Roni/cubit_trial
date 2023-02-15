import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_trial/bloc/cubit/counter_cubit.dart';
import 'package:bloc_trial/bloc/cubit/counter_state.dart';
import 'package:bloc_trial/bloc/cubit/internet_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit? counterCubit;
    InternetCubit? internetCubit;

    setUp(() {
      counterCubit = CounterCubit(
          // internetCubit: internetCubit!
      );
    });

    tearDown(() {
      counterCubit!.close();
    });

    test('initial state for the counterValue is 0', () {
      expect(counterCubit!.state, CounterState(counterValue: 0));
    });

    blocTest<CounterCubit, CounterState>('should emit counterValue 1, wasIncremented true',
        build: () => counterCubit!,
        act: (cubit) => cubit.increment(),
        expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest<CounterCubit, CounterState>('should emit counterValue -1, wasIncremented false',
      build: () => counterCubit!,
      act: (cubit) => cubit.decrement(),
      expect: () =>  [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}