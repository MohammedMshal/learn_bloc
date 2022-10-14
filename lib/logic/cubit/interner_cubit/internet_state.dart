part of 'internet_cubit.dart';

abstract class InternetState {}

class InternetLoading extends InternetState {}
class InternetConnection extends InternetState {
  final ConnectionType connectionType;

  InternetConnection(this.connectionType);
}
class InternetDisconnection extends InternetState {}
