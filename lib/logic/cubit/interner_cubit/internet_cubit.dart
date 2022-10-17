import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:learn_bloc/constans/constans.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
          if (connectivityResult == ConnectivityResult.wifi) {
            emit(InternetConnection(ConnectionType.wifi));
          } else if (connectivityResult == ConnectivityResult.mobile) {
            emit(InternetConnection(ConnectionType.mobile));
          } else if (connectivityResult == ConnectivityResult.none) {
            emit(InternetDisconnection());
          }
        });}}