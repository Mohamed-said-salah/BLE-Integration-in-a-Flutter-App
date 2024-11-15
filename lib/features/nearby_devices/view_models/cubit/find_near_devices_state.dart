// This file contains all the states for the FindNearDevicesCubit.
// The states are used to hold the data for the devices that are found.
// The states are also used to represent the different stages of the scanning process.
//
// The FindNearDevicesState is the base class for all the states.
// It contains a list of BluetoothDevice objects, which are the devices that are found.
// The FindNearDevicesState also contains a props getter, which returns a list of objects that are used to compare the states.
//
// The FindNearDevicesInitial state is the initial state of the FindNearDevicesCubit.
// It contains an empty list of devices.
//
// The BlueToothScanning state is the state that is emitted when the scanning process is started.
// It contains an empty list of devices.
//
// The BlueToothScanStopped state is the state that is emitted when the scanning process is stopped.
// It contains the list of devices that were found during the scanning process.
//
// The BlueToothFoundDevices state is the state that is emitted when the scanning process is finished.
// It contains the list of devices that were found during the scanning process.
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
