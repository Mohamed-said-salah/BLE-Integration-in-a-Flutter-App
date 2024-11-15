import 'package:ble_integration_in_flutter_app/features/permissions/view_models/bluetooth/bluetooth_status_cubit.dart';
import 'package:ble_integration_in_flutter_app/features/permissions/views/screens/enable_bluetooth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/fonts/font_families_names.dart';

class BluetoothButton extends StatelessWidget {
  const BluetoothButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<BluetoothStatusCubit, BluetoothStatusState>(
          builder: (context, state) {
            return InkWell(
              onTap: state is BluetoothEnabled
                  ? null
                  : () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EnableBluetoothScreen()));
                    },
              borderRadius: BorderRadius.circular(10),
              child: Ink(
                width: 160,
                height: 85,
                decoration: BoxDecoration(
                  color: state is BluetoothEnabled
                      ? Colors.blue.withOpacity(0.25)
                      : const Color(0xFFE5E5EA),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        state is BluetoothEnabled
                            ? Icons.bluetooth_connected_rounded
                            : Icons.bluetooth_disabled_rounded,
                        color: state is BluetoothEnabled
                            ? Colors.blue
                            : Colors.grey,
                        size: 30,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        state is BluetoothEnabled ? 'Enabled' : 'Disabled',
                        style: TextStyle(
                          color: state is BluetoothEnabled
                              ? Colors.blue
                              : Colors.grey.shade600,
                          fontSize: 20,
                          fontFamily: FontFamiliesNames.hostGroteskRegular,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
