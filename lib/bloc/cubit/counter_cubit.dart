import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_trial/bloc/cubit/counter_state.dart';
import 'package:bloc_trial/bloc/cubit/internet_cubit.dart';
import 'package:bloc_trial/bloc/cubit/internet_state.dart';
import 'package:bloc_trial/constants/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState>{

  final InternetCubit internetCubit;
  StreamSubscription<InternetState>? internetStreamSubscription;

  CounterCubit({required this.internetCubit}):
        super(const CounterState(counterValue: 0)){
    monitorInternetCubit();
  }
    StreamSubscription<InternetState> monitorInternetCubit() {
    return internetStreamSubscription = internetCubit.stream.listen((internetState){
      if(internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi){
        increment();
      }
      else if(internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Mobile){
        decrement();
      }
    });
  }

  void increment() => emit(CounterState(counterValue: (state.counterValue + 1),
      wasIncremented: true));

  void decrement() => emit(CounterState(counterValue: (state.counterValue - 1),
      wasIncremented: false));

  @override
  Future<void> close(){
    internetStreamSubscription!.cancel();
    return super.close();
  }
}