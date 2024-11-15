import 'package:ble_integration_in_flutter_app/features/permissions/view_models/bluetooth/bluetooth_status_cubit.dart';
import 'package:ble_integration_in_flutter_app/features/permissions/view_models/location/location_status_cubit.dart';
import 'package:ble_integration_in_flutter_app/features/permissions/views/screens/enable_bluetooth_screen.dart';
import 'package:ble_integration_in_flutter_app/features/permissions/views/screens/enable_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants/fonts/font_families_names.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<LocationStatusCubit, LocationStatusState>(
          builder: (context, state) {
            return InkWell(
              onTap: state is LocationEnabled
                  ? null
                  : () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EnableLocationScreen()));
                    },
              borderRadius: BorderRadius.circular(10),
              child: Ink(
                width: 160,
                height: 85,
                decoration: BoxDecoration(
                  color: state is LocationEnabled
                      ? Colors.greenAccent.withOpacity(0.25)
                      : const Color(0xFFE5E5EA),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        state is LocationEnabled
                            ? Icons.location_on_rounded
                            : Icons.location_off_rounded,
                        color: state is LocationEnabled
                            ? Colors.greenAccent
                            : Colors.grey,
                        size: 30,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        state is LocationEnabled ? 'Enabled' : 'Disabled',
                        style: TextStyle(
                          color: state is LocationEnabled
                              ? Colors.greenAccent
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
