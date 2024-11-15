part of 'find_near_devices_cubit.dart';

sealed class FindNearDevicesState extends Equatable {
  const FindNearDevicesState();

  @override
  List<Object> get props => [];
}

final class FindNearDevicesInitial extends FindNearDevicesState {}

final class BlueToothScanning extends FindNearDevicesState {}

final class BlueToothScanStopped extends FindNearDevicesState {}

final class BlueToothFoundDevices extends FindNearDevicesState {
  final List<BluetoothDevice> devices;

  const BlueToothFoundDevices(this.devices);

  @override
  List<Object> get props => [devices];
}
