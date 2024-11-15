import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../../../../../constants/fonts/font_families_names.dart';

/// A button widget that enables Bluetooth when tapped.
class EnableBluetoothButton extends StatelessWidget {
  const EnableBluetoothButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
        child: InkWell(
          onTap: () {
            // Attempt to turn on Bluetooth with a 30-second timeout
            FlutterBluePlus.turnOn(timeout: 30);
          },
          borderRadius: BorderRadius.circular(12),
          child: Ink(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 78, 177, 223),
                  Color.fromARGB(255, 102, 158, 221),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enable Bluetooth',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: FontFamiliesNames.hostGroteskRegular,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.bluetooth_connected_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
