import 'package:ble_integration_in_flutter_app/features/permissions/views/widgets/buttons/open_app_settings_button.dart';
import 'package:flutter/material.dart';

import '../../../../constants/fonts/font_families_names.dart';

/// The screen that is displayed when the user does not have location permissions enabled
class RequestLocationPermissionsScreen extends StatefulWidget {
  /// The route name for this screen
  static const String routeName = '/enable_location_screen';

  /// The default constructor for this screen
  const RequestLocationPermissionsScreen({super.key});

  @override
  State<RequestLocationPermissionsScreen> createState() =>
      _RequestLocationPermissionsScreenState();
}

/// The state for [RequestLocationPermissionsScreen]
class _RequestLocationPermissionsScreenState
    extends State<RequestLocationPermissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      /// The background color of the screen
      backgroundColor: Colors.white,

      /// The body of the screen
      body: Column(
        /// The main alignment of the column
        mainAxisAlignment: MainAxisAlignment.center,

        /// The children of the column
        children: [
          /// The spacer above the icon
          Spacer(flex: 2),

          /// The icon that is displayed when the user does not have location permissions enabled
          Icon(
            Icons.wrong_location_rounded,
            size: 150,
            color: Colors.grey,
          ),

          /// The spacer between the icon and the text
          Spacer(flex: 1),

          /// The text that is displayed when the user does not have location permissions enabled
          Text(
            'Location Permissions Denied',
            style: TextStyle(
              fontSize: 24,
              fontFamily: FontFamiliesNames.hostGroteskSemiBold,
            ),
          ),

          /// The space between the text and the additional text
          SizedBox(height: 10),

          /// The additional text that is displayed when the user does not have location permissions enabled
          Text(
            'It looks like you permanently refused to grant location permissions to this app. Please grant permissions for the app to function well.',
            style: TextStyle(
              fontSize: 16,
              fontFamily: FontFamiliesNames.hostGroteskRegular,
            ),
            textAlign: TextAlign.center,
          ),

          /// The spacer between the additional text and the button
          Spacer(flex: 1),

          /// The button that the user can click to open the app settings
          OpenAppSettingsButton(),

          /// The spacer below the button
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
