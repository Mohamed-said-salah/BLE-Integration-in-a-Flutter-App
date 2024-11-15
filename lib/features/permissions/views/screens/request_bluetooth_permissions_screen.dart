import 'package:ble_integration_in_flutter_app/features/permissions/views/widgets/buttons/open_app_settings_button.dart';
import 'package:flutter/material.dart';

import '../../../../constants/fonts/font_families_names.dart';

// This widget is the main widget for this screen
// It is displayed when the user has permanently denied the app to access the Bluetooth
// It prompts the user to open the app settings in order to grant the permissions
class RequestBluetoothPermissionsScreen extends StatefulWidget {
  static const String routeName = '/request_bluetooth_permissions_screen';

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
      // The background color of the screen
      backgroundColor: Colors.white,

      // The body of the screen
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // The spacer above the icon
          Spacer(flex: 2),

          // The icon that is displayed when the user does not have Bluetooth permissions enabled
          Icon(
            Icons.bluetooth_disabled_outlined,
            size: 150,
            color: Colors.grey,
          ),

          // The spacer between the icon and the text
          Spacer(flex: 1),

          // The text that is displayed when the user does not have Bluetooth permissions enabled
          Text(
            'Bluetooth Permissions Denied',
            style: TextStyle(
              fontSize: 24,
              fontFamily: FontFamiliesNames.hostGroteskSemiBold,
            ),
          ),

          // The space between the text and the additional text
          SizedBox(height: 10),

          // The additional text that is displayed when the user does not have Bluetooth permissions enabled
          Text(
            'It looks like you permanently refused to grant Bluetooth permissions to this app. Please grant permissions for the app to function well.',
            style: TextStyle(
              fontSize: 16,
              fontFamily: FontFamiliesNames.hostGroteskRegular,
            ),
            textAlign: TextAlign.center,
          ),

          // The spacer between the additional text and the button
          Spacer(flex: 1),

          // The button that is displayed when the user does not have Bluetooth permissions enabled
          // It prompts the user to open the app settings in order to grant the permissions
          OpenAppSettingsButton(),

          // The spacer below the button
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
