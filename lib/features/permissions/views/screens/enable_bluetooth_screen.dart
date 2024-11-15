// This screen is displayed when the user does not have bluetooth enabled
// It prompts the user to enable it
import 'package:ble_integration_in_flutter_app/features/permissions/view_models/bluetooth/bluetooth_status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../constants/fonts/font_families_names.dart';
import '../../../../constants/animations/animation_assets_paths.dart';
import '../widgets/buttons/back_to_find_devices_screen_button.dart';
import '../widgets/buttons/enable_bluetooth_button.dart';

// This widget displays the screen when the user has bluetooth enabled
class BluetoothEnabledView extends StatelessWidget {
  const BluetoothEnabledView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 2),
        SizedBox(
          height: 200,
          width: 200,
          child: Lottie.asset(
            AnimationAssetsPaths.doneBlueAnimations,
          ),
        ),
        const Spacer(flex: 1),
        const Text(
          'Bluetooth Enabled',
          style: TextStyle(
            fontSize: 24,
            fontFamily: FontFamiliesNames.hostGroteskSemiBold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'You can now start scanning and connect for bluetooth devices',
          style: TextStyle(
            fontSize: 16,
            fontFamily: FontFamiliesNames.hostGroteskRegular,
          ),
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 1),
        const BackToFindDevicesScreenButton(),
        const Spacer(flex: 1),
      ],
    );
  }
}

// This widget displays the screen when the user does not have bluetooth enabled
class EnableBlueToothView extends StatefulWidget {
  const EnableBlueToothView({super.key});

  @override
  State<EnableBlueToothView> createState() => _EnableBlueToothViewState();
}

class _EnableBlueToothViewState extends State<EnableBlueToothView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 2),
        SizedBox(
          height: 250,
          width: 250,
          child: Lottie.asset(AnimationAssetsPaths.enableBluetooth),
        ),
        const Spacer(flex: 1),
        const Text(
          'Enable Bluetooth',
          style: TextStyle(
            fontSize: 24,
            fontFamily: FontFamiliesNames.hostGroteskSemiBold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'We need to enable Bluetooth and allow all of it\'s permissions to ensure this app works properly',
          style: TextStyle(
            fontSize: 16,
            fontFamily: FontFamiliesNames.hostGroteskRegular,
          ),
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 1),
        const EnableBluetoothButton(),
        const Spacer(flex: 1),
      ],
    );
  }
}

// This widget is the main widget for this screen
class EnableBluetoothScreen extends StatelessWidget {
  static const String routeName = '/enable_bluetooth_screen';

  const EnableBluetoothScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<BluetoothStatusCubit, BluetoothStatusState>(
        builder: (context, state) {
          if (state is BluetoothEnabled) {
            return const BluetoothEnabledView();
          }

          return const EnableBlueToothView();
        },
      ),
    );
  }
}
