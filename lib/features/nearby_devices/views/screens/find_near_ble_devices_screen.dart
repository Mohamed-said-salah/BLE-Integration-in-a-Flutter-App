import 'package:ble_integration_in_flutter_app/constants/animations/animation_assets_paths.dart';
import 'package:ble_integration_in_flutter_app/features/nearby_devices/view_models/cubit/find_near_devices_cubit.dart';
import 'package:ble_integration_in_flutter_app/features/nearby_devices/views/widgets/buttons/bluetooth_button.dart';
import 'package:ble_integration_in_flutter_app/features/nearby_devices/views/widgets/buttons/location_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:lottie/lottie.dart';

import '../../../../constants/fonts/font_families_names.dart';
import '../../../data_exchange_with_device/views/screens/exchange_data_with_connected_device_screen.dart';
import '../widgets/buttons/scan_for_devices_button.dart';

class FindNearBleDevicesScreen extends StatefulWidget {
  const FindNearBleDevicesScreen({super.key});

  @override
  State<FindNearBleDevicesScreen> createState() =>
      _FindNearBleDevicesScreenState();
}

class _FindNearBleDevicesScreenState extends State<FindNearBleDevicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 25),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BluetoothButton(),
              LocationButton(),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              children: [
                StreamBuilder<bool>(
                  initialData: false,
                  stream: FlutterBluePlus.isScanning,
                  builder: (_, snapshot) {
                    if (snapshot.data == true) {
                      return Column(
                        children: [
                          Center(
                            child: SizedBox(
                              width: 120,
                              height: 120,
                              child: Lottie.asset(
                                  AnimationAssetsPaths.bluetoothSearch),
                            ),
                          ),
                          const Text(
                            "Scanning for devices...",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blueAccent,
                              fontFamily:
                                  FontFamiliesNames.eduAUVICWANTPreSemiBold,
                            ),
                          ),
                        ],
                      );
                    }

                    return const ScanForDevicesButton();
                  },
                ),
                const SizedBox(height: 20),
                BlocBuilder<FindNearDevicesCubit, FindNearDevicesState>(
                  builder: (context, state) {
                    if (state.devices.isNotEmpty) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.devices.length,
                          itemBuilder: (context, index) {
                            return StreamBuilder<Object>(
                                stream: state.devices[index].connectionState,
                                builder: (context, snapshot) {
                                  final connectionState = snapshot.data ??
                                      BluetoothConnectionState.disconnected;

                                  return ListTile(
                                    onTap: () {
                                      if (connectionState ==
                                          BluetoothConnectionState.connected) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ExchangeDataWithConnectedDeviceScreen(
                                              device: state.devices[index],
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    leading: const Icon(Icons.bluetooth),
                                    title: Text(state.devices[index].advName),
                                    subtitle: Text(state.devices[index].id.str),
                                    trailing: connectionState ==
                                            BluetoothConnectionState.connected
                                        ? const Text(
                                            "Connected",
                                            style:
                                                TextStyle(color: Colors.green),
                                          )
                                        : state is BlueToothScanning
                                            ? const SizedBox()
                                            : ConnectToDeviceButton(
                                                onPressed: () {
                                                  try {
                                                    state.devices[index]
                                                        .connect();
                                                  } catch (e) {
                                                    print('❌❌❌❌❌❌❌❌❌');
                                                    print(e);
                                                  }
                                                },
                                              ),
                                  );
                                });
                          },
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ConnectToDeviceButton extends StatelessWidget {
  final Function() onPressed;
  const ConnectToDeviceButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.withOpacity(0.5),
        shadowColor: Colors.transparent,
      ),
      child: const Text(
        'Connect',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
