part of 'bluetooth_status_cubit.dart';

sealed class BluetoothStatusState extends Equatable {
  const BluetoothStatusState();

  @override
  List<Object> get props => [];
}

final class BluetoothStatusInitial extends BluetoothStatusState {}

final class BluetoothEnabled extends BluetoothStatusState {}

final class BluetoothDisabled extends BluetoothStatusState {}
