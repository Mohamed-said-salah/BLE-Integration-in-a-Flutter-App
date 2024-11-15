import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

part 'find_near_devices_state.dart';

class FindNearDevicesCubit extends Cubit<FindNearDevicesState> {
  // Private constructor for singleton pattern
  FindNearDevicesCubit._internal() : super(const FindNearDevicesInitial([]));

  // Singleton instance
  static final FindNearDevicesCubit _instance =
      FindNearDevicesCubit._internal();

  // Factory constructor to return the singleton instance
  factory FindNearDevicesCubit() => _instance;

  final List<BluetoothDevice> _devices = [];

  void startScan() async {
    if (state is! BlueToothScanning) {
      emit(BlueToothScanning(_devices));

      _devices.clear();

      if (FlutterBluePlus.adapterStateNow == BluetoothAdapterState.on) {
        // Start scanning
        await FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));

        // Listen for scan results
        FlutterBluePlus.onScanResults.listen((results) {
          for (ScanResult r in results) {
            if (!_devices.contains(r.device)) {
              _devices.add(r.device);
            }

            // Emit the devices found state with the updated list of devices
            emit(BlueToothScanning(List.from(_devices)));
          }
        });

        // stop the scanning after 15 seconds timeout and if result is empty
        // it will emit the BlueToothScanStopped state
        Future.delayed(const Duration(seconds: 10)).then((_) async {
          if (FlutterBluePlus.isScanningNow) {
            await FlutterBluePlus.stopScan();
          }

          if (_devices.isEmpty) {
            emit(BlueToothScanStopped(_devices));
          } else {
            // Emit the devices found state with the updated list of devices
            emit(BlueToothFoundDevices(List.from(_devices)));
          }
        });
      } else {
        // when the bluetooth is not enabled
        emit(BlueToothScanStopped(_devices));
      }
    }
  }

  void stopScan() async {
    await FlutterBluePlus.stopScan();

    emit(BlueToothScanStopped(_devices));
  }
}
