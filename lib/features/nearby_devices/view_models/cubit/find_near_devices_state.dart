part of 'find_near_devices_cubit.dart';

sealed class FindNearDevicesState extends Equatable {
  const FindNearDevicesState(this.devices);

  final List<BluetoothDevice> devices;

  @override
  List<Object> get props => [devices];
}

final class FindNearDevicesInitial extends FindNearDevicesState {
  const FindNearDevicesInitial(super.devices);

  @override
  List<Object> get props => [super.devices];
}

final class BlueToothScanning extends FindNearDevicesState {
  const BlueToothScanning(super.devices);

  @override
  List<Object> get props => [super.devices];
}

final class BlueToothScanStopped extends FindNearDevicesState {
  const BlueToothScanStopped(super.devices);

  @override
  List<Object> get props => [super.devices];
}

final class BlueToothFoundDevices extends FindNearDevicesState {
  const BlueToothFoundDevices(super.devices);

  @override
  List<Object> get props => [super.devices];
}
