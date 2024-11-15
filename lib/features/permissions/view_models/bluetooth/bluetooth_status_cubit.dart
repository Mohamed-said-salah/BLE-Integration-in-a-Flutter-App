import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

part 'bluetooth_status_state.dart';

class BluetoothStatusCubit extends Cubit<BluetoothStatusState> {
  BluetoothStatusCubit._internal() : super(BluetoothStatusInitial()) {
    _bluetoothStateSubscription =
        FlutterBluePlus.adapterState.listen((bluetoothState) {
      if (bluetoothState == BluetoothAdapterState.off) {
        emit(BluetoothDisabled());
      } else {
        emit(BluetoothEnabled());
      }
    });

    // get the bluetooth state when app starts
    final firstBluetoothState = FlutterBluePlus.adapterStateNow;

    // and if bluetooth is turned off the app will start with
    // enable bluetooth screen as home
    if (firstBluetoothState == BluetoothAdapterState.off) {
      emit(BluetoothDisabled());

      // else if will start with nearby devices screen
    } else {
      emit(BluetoothEnabled());
    }
  }

  // Singleton instance
  static final BluetoothStatusCubit _instance =
      BluetoothStatusCubit._internal();
  factory BluetoothStatusCubit() => _instance;

  // Initialize Bluetooth status listener
  StreamSubscription? _bluetoothStateSubscription;

  @override
  Future<void> close() {
    _bluetoothStateSubscription?.cancel();
    return super.close();
  }
}
