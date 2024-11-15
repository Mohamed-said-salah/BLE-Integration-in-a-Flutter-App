import 'package:ble_integration_in_flutter_app/features/nearby_devices/view_models/cubit/find_near_devices_cubit.dart';
import 'package:ble_integration_in_flutter_app/features/nearby_devices/views/screens/find_near_ble_devices_screen.dart';

import 'package:ble_integration_in_flutter_app/services/permissions.services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/permissions/view_models/bluetooth/bluetooth_status_cubit.dart';
import 'features/permissions/view_models/location/location_status_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<BluetoothStatusCubit>(
          create: (_) => BluetoothStatusCubit(),
        ),
        BlocProvider<LocationStatusCubit>(
          create: (_) => LocationStatusCubit(),
        ),
        BlocProvider<FindNearDevicesCubit>(
          create: (_) => FindNearDevicesCubit(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();

    Future.sync(() async {
      await PermissionsServices.requestBluetooth();
      await PermissionsServices.requestLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FindNearBleDevicesScreen(),
    );
  }
}
