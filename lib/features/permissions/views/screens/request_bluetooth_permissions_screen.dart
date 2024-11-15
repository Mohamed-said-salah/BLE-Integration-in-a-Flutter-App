import 'package:ble_integration_in_flutter_app/features/permissions/views/widgets/buttons/open_app_settings_button.dart';
import 'package:flutter/material.dart';

import '../../../../constants/fonts/font_families_names.dart';

class RequestBluetoothPermissionsScreen extends StatefulWidget {
  static const String routeName = '/enable_location_screen';

  const RequestBluetoothPermissionsScreen({super.key});

  @override
  State<RequestBluetoothPermissionsScreen> createState() =>
      _RequestBluetoothPermissionsScreenState();
}

class _RequestBluetoothPermissionsScreenState
    extends State<RequestBluetoothPermissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          Icon(
            Icons.bluetooth_disabled_outlined,
            size: 150,
            color: Colors.grey,
          ),
          Spacer(flex: 1),
          Text(
            'Bluetooth Permissions Denied',
            style: TextStyle(
              fontSize: 24,
              fontFamily: FontFamiliesNames.hostGroteskSemiBold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'It looks like you permanently refused to grant Bluetooth permissions to this app. Please grant permissions for the app to function well.',
            style: TextStyle(
              fontSize: 16,
              fontFamily: FontFamiliesNames.hostGroteskRegular,
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(flex: 1),
          OpenAppSettingsButton(),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
