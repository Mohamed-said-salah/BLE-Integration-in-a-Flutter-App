import 'package:ble_integration_in_flutter_app/features/permissions/views/widgets/buttons/enable_location_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lottie/lottie.dart';

import '../../../../constants/fonts/font_families_names.dart';
import '../../../../constants/animations/animation_assets_paths.dart';
import '../../view_models/location/location_status_cubit.dart';
import '../widgets/buttons/back_to_find_devices_screen_button.dart';

class EnableLocationScreen extends StatefulWidget {
  static const String routeName = '/enable_location_screen';

  const EnableLocationScreen({super.key});

  @override
  State<EnableLocationScreen> createState() => _EnableLocationScreenState();
}

class _EnableLocationScreenState extends State<EnableLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<LocationStatusCubit, LocationStatusState>(
        builder: (context, state) {
          if (state is LocationEnabled) {
            return const LocationEnabledView();
          }

          return const EnableLocationView();
        },
      ),
    );
  }
}

class EnableLocationView extends StatelessWidget {
  const EnableLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 2),
        SizedBox(
          height: 250,
          width: 250,
          child: Lottie.asset(AnimationAssetsPaths.enableLocation),
        ),
        const Spacer(flex: 1),
        const Text(
          'Enable Location',
          style: TextStyle(
            fontSize: 24,
            fontFamily: FontFamiliesNames.hostGroteskSemiBold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'We need to enable Location and allow all of it\'s permissions to ensure this app works properly',
          style: TextStyle(
            fontSize: 16,
            fontFamily: FontFamiliesNames.hostGroteskRegular,
          ),
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 1),
        const EnableLocationButton(),
        const Spacer(flex: 1),
      ],
    );
  }
}

class LocationEnabledView extends StatelessWidget {
  const LocationEnabledView({super.key});

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
          'Location Enabled',
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
