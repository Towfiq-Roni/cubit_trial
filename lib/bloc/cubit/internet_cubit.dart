import 'dart:async';
// import 'package:bloc/bloc.dart';
import 'package:bloc_trial/bloc/cubit/internet_state.dart';
import 'package:bloc_trial/constants/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetState> {

  final Connectivity connectivity;
  StreamSubscription<ConnectivityResult>? connectivityStreamSubscription;

  InternetCubit({required this.connectivity})
      : super(InternetLoading()) {
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
          if (connectivityResult == ConnectivityResult.wifi) {
            emitInternetConnected(ConnectionType.Wifi);
          }
          else if (connectivityResult == ConnectivityResult.mobile) {
            emitInternetConnected(ConnectionType.Mobile);
          }
          else if (connectivityResult == ConnectivityResult.none) {
            emitInternetDisconnected();
          }
        });
  }

  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close(){
    connectivityStreamSubscription!.cancel();
    return super.close();
  }
}