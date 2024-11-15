import 'package:ble_integration_in_flutter_app/features/nearby_devices/view_models/cubit/find_near_devices_cubit.dart';
import 'package:ble_integration_in_flutter_app/features/permissions/views/screens/enable_location_screen.dart';
import 'package:ble_integration_in_flutter_app/features/permissions/views/screens/request_bluetooth_permissions_screen.dart';
import 'package:ble_integration_in_flutter_app/features/permissions/views/screens/request_location_permissions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../../constants/fonts/font_families_names.dart';
import '../../../../../services/permissions.services.dart';
import '../../../../permissions/views/screens/enable_bluetooth_screen.dart';

class ScanForDevicesButton extends StatefulWidget {
  const ScanForDevicesButton({super.key});

  @override
  State<ScanForDevicesButton> createState() => _ScanForDevicesButtonState();
}

class _ScanForDevicesButtonState extends State<ScanForDevicesButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
        child: InkWell(
          onTap: () async {
            if (!_isLoading) {
              setState(() => _isLoading = true);

              // handle the bluetooth permissions
              if (await PermissionsServices.requestBluetooth() ==
                  PermissionStatus.permanentlyDenied) {
                await Future.sync(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          const RequestBluetoothPermissionsScreen(),
                    ),
                  );
                });

                return setState(() => _isLoading = false);
              }

              // handle the location permissions
              if (await PermissionsServices.requestLocation() ==
                  PermissionStatus.permanentlyDenied) {
                await Future.sync(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          const RequestLocationPermissionsScreen(),
                    ),
                  );
                });

                return setState(() => _isLoading = false);
              }

              // handle the bluetooth status to be enabled
              if (FlutterBluePlus.adapterStateNow != BluetoothAdapterState.on) {
                await Future.sync(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EnableBluetoothScreen(),
                    ),
                  );
                });

                return setState(() => _isLoading = false);
              }

              // handle the location status to be enabled
              if (!(await Geolocator.isLocationServiceEnabled())) {
                await Future.sync(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EnableLocationScreen(),
                    ),
                  );
                });

                return setState(() => _isLoading = false);
              }

              FindNearDevicesCubit().startScan();

              setState(() => _isLoading = false);
            }
          },
          borderRadius: BorderRadius.circular(12),
          child: Ink(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Scan for devices',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: FontFamiliesNames.hostGroteskRegular,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  if (!_isLoading) ...const [
                    Icon(
                      Icons.bluetooth_searching_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ] else ...[
                    const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
